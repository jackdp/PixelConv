unit PIXC.Types;

interface

const
  //APP_ID = 59;
  {$IFDEF WIN64}
  APP_BITS_STR = '64';
  {$ELSE}
  APP_BITS_STR = '32';
  {$ENDIF}
  APP_NAME = 'PixelConv';
  APP_VER_STR = '1.0';
  APP_FULL_NAME = APP_NAME + ' ' + APP_VER_STR + '   [' + APP_BITS_STR + '-bit]';
  APP_DATE_STR = '2022.06.23';
  //URL_HOMEPAGE = 'https://www.pazera-software.com/products/pixel-converter/';
  URL_DONATION = 'https://www.pazera-software.com/donation/';
  URL_GITHUB = 'https://github.com/jackdp/PixelConv';
  APP_LICENSE = 'Freeware (public domain). Open source';

implementation

end.
