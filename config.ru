require 'bundler/setup'
require 'rack'

Rack::Mime::MIME_TYPES['.woff'] = 'application/x-font-woff'

use Rack::Static,
    :urls => ["/stylesheets", "/images", "/font", "/favicon.ico"],
    :root => "public"

run lambda { |env|
  [
      200,
      {
        'Content-Type'  => 'text/html',
        'Cache-Control' => 'public, max-age=86400'
      },
      File.open('public/index.html', File::RDONLY)
    ]
}
