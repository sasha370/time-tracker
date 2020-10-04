module FakeSms

  # создаем фейковую БД в видке Struct
  Message = Struct.new(:number, :message)
  # и пустой массив для хранения посланных sms
  @messages = []

  # В фейковом случаем посылаем sms в наш масси, чтобы потом можно было протестировать
  def self.send_sms(number:, message:)
    @messages << Message.new(number, message)
  end

  def self.messages
    @messages
  end

end
