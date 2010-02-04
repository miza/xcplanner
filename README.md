XC Planner Google Maps cross country flight planning tool
=========================================================

XC Planner is a web application.  You install it on a web server and then can access it from anywhere using your web browser.


Basic Installation
------------------

1. Unpack XC Planner in to a suitable directory on your webserver, e.g. `/var/www/html/xcplanner`.

2. Get a Google Maps API key for your website from http://code.google.com/apis/maps/signup.html and set `$GOOGLE_MAPS_API_KEY` to this in `config.php`.  The default key distributed with XC Planner is for `http://localhost/`.

3. Install the [Smarty](http://www.smarty.net/) PHP template library and set `$SMARTY_DIR` in `config.php` to point to the directory containing `Smarty.class.php`.  Packages for Smarty are available in most Linux distributions. The RedHat package is called `php-Smarty` and the Debian package is called `smarty`.

4. Make sure that the templates_c directory is writeable by the webserver, e.g. `chown apache:apache templates_c`.

5. Point your web browser at `http://localhost/xcplanner/`.


Linking to XC Planner
---------------------

XC Planner accepts a query string which is used to set the initial state.  These are:

* `location=`_name_
* `flightType=`_type_
* `turnpoints=[[`_lat1_`,`_lng1_`],[`_lat2_`,`_lng2_`],`...`]`
* `start=[`_lat_`,`_lng_`]`

These can be used to set sensible defaults if you want to link to XC planner from your XC league&quot;s website.  For example:

* OLC 5-point flight around Interlaken: `http://localhost/xcplanner/?location=Interlaken&flightType=olc5`
* CFD FAI triangle around Chamonix: `http://localhost/xcplanner/?location=Chamonix&flightType=cfd3c`


Advanced Installation
---------------------

### Elevation data ###

XC Planner can use [CGIAR-CSI](http://srtm.csi.cgiar.org/) data to determine turnpoint elevations.  The program `bin/srtm-get` can be used to download and prepare this data for use.  It is advisable to download the CGIAR-CSI tiles for the areas you wish to cover. For example, to download the data for Europea, run

	bin/srtm-get --europe

To download the the data for the entire world, run

	bin/srtm-get --all

XC Planner will, by default, use an simple compressed format for the elevation data.  Individual rows of elevation data are compressed separately which gives a disk space saving of approximately 70% over uncompressed data at the expense of having to uncompress one row (12000 bytes) each time an elevation datum is requested.  For popular areas, you may wish to store uncompressed tiles which are larger (72MB per tile) but are much faster to access.

The recommended configuration is to use compressed tiles for all areas except the European Alps.  This can be achieved with the two commands:

	bin/srtm-get --all
	bin/srtm-get --european-alps --tile

XC Planner can use a USGS webservice to retrieve elevation data if the SRTM tiles are not available.  Set `$get_elevation` in `config.php` to `get_elevation_usgs` to enable it.  However, this is not recommended because this is very slow.