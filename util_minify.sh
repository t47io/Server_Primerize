sudo rm media/js/admin/min/*.min.js
java -jar ../yuicompressor.jar -o '.js$:.min.js' media/js/admin/*.js
mv media/js/admin/*.min.js media/js/admin/min/

sudo rm media/js/public/min/*.min.js
java -jar ../yuicompressor.jar -o '.js$:.min.js' media/js/public/*.js
mv media/js/public/*.min.js media/js/public/min/

sudo rm media/js/suit/min/*.min.js
java -jar ../yuicompressor.jar -o '.js$:.min.js' media/js/suit/*.js
mv media/js/suit/*.min.js media/js/suit/min/

sudo rm media/css/min/*.min.css
java -jar ../yuicompressor.jar -o '.css$:.min.css' media/css/*.css
rm media/css/*.min.min.css
mv media/css/*.min.css media/css/min/
mv media/css/min/bootstrap.min.css media/css/

cat media/js/jquery.min.js media/js/bootstrap.min.js > media/js/public/min/core.min.js
cat media/js/d3.min.js media/js/clipboard.min.js media/js/public/min/plate.min.js > media/js/public/min/plt.min.js

cat media/js/public/min/api.min.js media/js/public/min/page.min.js > media/js/public/min/page.js
rm media/js/public/min/api.min.js media/js/public/min/page.min.js
mv media/js/public/min/page.js media/js/public/min/page.min.js

cat media/js/suit/min/core.min.js media/js/suit/min/RelatedObjectLookups.min.js media/js/suit/min/jquery.init.min.js media/js/suit/min/actions.min.js media/js/suit/min/jquery.formset.min.js media/js/suit/min/DateTimeShortcuts.min.js > media/js/suit/min/core.js
rm media/js/suit/min/core.min.js media/js/suit/min/RelatedObjectLookups.min.js media/js/suit/min/jquery.init.min.js media/js/suit/min/actions.min.js media/js/suit/min/jquery.formset.min.js media/js/suit/min/DateTimeShortcuts.min.js
mv media/js/suit/min/core.js media/js/suit/min/core.min.js

cat media/js/suit/min/calendar.min.js media/js/suit/min/RelatedWidgetWrapper.min.js media/js/suit/min/SelectBox.min.js media/js/suit/min/SelectFilter2.min.js > media/js/suit/min/form.js
rm media/js/suit/min/calendar.min.js media/js/suit/min/RelatedWidgetWrapper.min.js media/js/suit/min/SelectBox.min.js media/js/suit/min/SelectFilter2.min.js
mv media/js/suit/min/form.js media/js/suit/min/form.min.js

cat media/js/admin/min/_suit.min.js media/js/admin/min/clock.min.js media/js/admin/min/menu.min.js > media/js/admin/min/menu.js
rm media/js/admin/min/_suit.min.js media/js/admin/min/clock.min.js media/js/admin/min/menu.min.js
mv media/js/admin/min/menu.js media/js/admin/min/menu.min.js

cat media/css/bootstrap.min.css media/css/min/theme.min.css media/css/min/palette.min.css > media/css/min/core.min.css

cat media/css/min/theme.min.css media/css/min/palette.min.css > media/css/min/theme.css
rm media/css/min/theme.min.css media/css/min/palette.min.css
mv media/css/min/theme.css media/css/min/theme.min.css

mv media/css/min/_suit.min.css media/css/min/suit.min.css
mv media/css/min/_filemanager.min.css media/css/min/filemanager.min.css

