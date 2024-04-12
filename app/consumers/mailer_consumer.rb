# app/consumers/mailer_consumer.rb
# require 'sneakers'

class MailerConsumer
  include Sneakers::Worker

  from_queue 'mailer'

  def work(message)
    data = JSON.parse(message)

    action = data['action']
    UserMailer.send(action, data).deliver_now if action

    ack!
  end
end
