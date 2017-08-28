Rails.application.routes.draw do
  mount T2Airtime::Engine => '/'
  root to: 't2_airtime/airtime#countries'
end
