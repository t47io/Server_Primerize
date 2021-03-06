# Primerize PCR Assembly Design Server

<img src="https://primerize.stanford.edu/site_media/images/logo_primerize.png" alt="Primerize Logo" width="200" align="right">

This is the _Source Code_ repository for **Primerize** PCR Primer Assembly Design **Server**. The production server is freely accessible at https://primerize.stanford.edu/.

## Installation

**Primerize Server** requires the following *Python* packages as dependencies, most of which can be installed through [`pip`](https://pip.pypa.io/).

```json
boto >= 2.38.0
Django >= 1.9.1
django-adminplus >= 0.5
django-crontab >= 0.7.0
django-environ >= 0.4.0
django-filemanager == 0.0.2
django-suit >= 0.2.15
django-widget-tweaks >= 1.4.1
gviz-api.py == 1.8.2
MySQL-python >= 1.2.5
PyGithub >= 1.26.0
pytz >= 2015.7
requests >= 2.9.1
simplejson >= 3.8.1

primerize >= 1.1.0
```

The `primerize` package is available internally at https://github.com/DasLab/Primerize/.

The `gviz-api.py` is available at https://github.com/google/google-visualization-python/.

The `django-filemanager` is a modified version of https://github.com/IMGIITRoorkee/django-filemanager/. The source code is available internally. Install with `sudo python setup.py install`.

**Primerize Server** also requires proper setup of `llvm`, `mysql.server`, `apache2`, `mod_wsgi`, `openssl`, `gdrive`, `awscli`, and `cron` jobs.

Lastly, assets preparation is required for the 1st time through running `sudo python manage.py versions`, `sudo python manage.py dist`, `util_prep_dir.sh`, `util_src_dist.sh`, `util_minify.sh`, `util_chmod.sh` and manually replacing `config/*.conf`. For full configuration, please refer to **Documentation**.


## Usage

To run the test/dev server, use:

```bash
cd path/to/server_primerize/repo
python manage.py runserver
```

## Documentation

- Documentation is available at admin [manual](https://primerize.stanford.edu/admin/man/) and [reference](https://primerize.stanford.edu/admin/ref/).

- Alternatively, read the repository [**Wiki**](https://github.com/t47io/Django-Server-Primerize/wiki/).

## License

**Copyright &copy; 2014-2016: Siqi Tian _[[t47](https://t47.io/)]_, Das Lab, Stanford University. All Rights Reserved.**

**Primerize Server** _Source Code_ is proprietary and confidential. Unauthorized copying of this repository, via any medium, is strictly prohibited.

Copyright &copy; of **Primerize** _Source Code_ is described in [LICENSE.md](https://github.com/DasLab/Primerize/blob/master/LICENSE.md).

## Reference

>Tian, S., *et al.* (**2015**)<br/>
>[Primerize: Automated Primer Assembly for Transcribing Interesting RNAs.](http://nar.oxfordjournals.org/content/43/W1/W522.full)<br/>
>*Nucleic Acid Research* **43 (W1)**: W522-W526.

>Tian, S., and Das, R. (**2016**)<br/> 
>Primerize-2D: automated primer design for RNA multidimensional chemical mapping.<br/>
>*manuscript in preparation.*


by [**t47**](http://t47.io/), *August 2016*.

