class QrController < ApplicationController
  def code
    @qrcode = RQRCode::QRCode.new("https://www.youtube.com/watch?v=oHg5SJYRHA0")
  end
end
