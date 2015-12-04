import datetime
import subprocess
import sys
import time
import traceback

from django.core.management.base import BaseCommand

from src.settings import *
from src.models import *


class Command(BaseCommand):
    help = 'Cleans up old job results from database and folders.'

    def handle(self, *args, **options):
        t0 = time.time()
        self.stdout.write('%s:\t%s' % (time.ctime(), ' '.join(sys.argv)))

        flag = False
        t = time.time()
        self.stdout.write("Cleaning up obsolete job results...")

        all_job = JobIDs.objects.filter(date__range=(datetime.date(1970, 1, 2), datetime.date.today() - datetime.timedelta(days=KEEP_JOB * 30)))

        try:
            for job in all_job:
                if job.type == '1':
                    obj = Design1D.objects.get(job_id=job.job_id)
                    obj.delete()
                    subprocess.Popen('rm %s/data/1d/result_%s.txt' % (MEDIA_ROOT, job.job_id), shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
                    subprocess.Popen('rm %s/data/1d/result_%s.html' % (MEDIA_ROOT, job.job_id), shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
                elif job.type == '2':
                    obj = Design2D.objects.get(job_id=job.job_id)
                    obj.delete()
                    subprocess.Popen('rm -rf %s/data/2d/%s' % (MEDIA_ROOT, job.job_id), shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
                elif job.type == '3':
                    obj = Design3D.objects.get(job_id=job.job_id)
                    obj.delete()
                    subprocess.Popen('rm -rf %s/data/3d/%s' % (MEDIA_ROOT, job.job_id), shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
                job.delete()
        except:
            self.stdout.write("    \033[41mERROR\033[0m: Failed to remove JOB_ID \033[94m%s\033." % job.job_id)
            err = traceback.format_exc()
            ts = '%s\t\t%s\n' % (time.ctime(), ' '.join(sys.argv))
            open('%s/cache/log_alert_admin.log' % MEDIA_ROOT, 'a').write(ts)
            open('%s/cache/log_cron_cleanup.log' % MEDIA_ROOT, 'a').write('%s\n%s\n' % (ts, err))
            flag = True


        if not flag: self.stdout.write("    \033[92mSUCCESS\033[0m: \033[94m%s\033[0m obsolete job result files removed." % len(all_job))
        self.stdout.write("Time elapsed: %.1f s.\n" % (time.time() - t))

        if flag:
            self.stdout.write("Finished with errors!")
            self.stdout.write("Time elapsed: %.1f s." % (time.time() - t0))
            sys.exit(1)
        else:
            self.stdout.write("All done successfully!")
            self.stdout.write("Time elapsed: %.1f s." % (time.time() - t0))
