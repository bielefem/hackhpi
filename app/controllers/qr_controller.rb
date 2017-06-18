class QrController < ApplicationController
  before_action :authenticate_employee!
  def code
    @qrcode = RQRCode::QRCode.new("#{{ssid:'AltEichenHospital', ip:'192.162.18.23', key:'adsipnqwiprnfipqwnfipq'}.to_json}")
  end
end
