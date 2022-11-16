class LinepayService
  def initialize(api_type)
    @api_type = api_type
  end

  def perform(request_body = nil)
    conn = Faraday.new(url: ENV['Line_pay_end_point']) do |f|
      f.request :json # encode req bodies as JSON and automatically set the Content-Type header
      f.response :json # decode response bodies as JSON
    end

    response = conn.post("/v2/#{@api_type}") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-LINE-ChannelId'] = ENV['Line_pay_channel_id']
      req.headers['X-LINE-ChannelSecret'] = ENV['Line_pay_channel_secret']
      req.body = request_body
    end
    @result = response.body
  end

  def success?
    @result['returnCode'] == '0000'
  end

  def payment_url
    @result['info']['paymentUrl']['web']
  end

  def order_id
    @result['info']['orderId']
  end

  def transaction_id
    @result['info']['transactionId']
  end
end
