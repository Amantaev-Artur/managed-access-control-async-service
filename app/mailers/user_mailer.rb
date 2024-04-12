class UserMailer < ApplicationMailer
  default :from => ENV['EMAIL_FROM']

  def new_access_in_group(data)
    @group = data['group']
    @access = data['access']

    mail(to: data['email'], subject: 'Новый доступ открыт для Вас')
  end

  def delete_from_group(data)
    @group = data['group']

    mail(to: data['email'], subject: 'Вас удалили из группы')
  end

  def welcome_to_group(data)
    @group = data['group']

    mail(to: data['email'], subject: 'Вас добавили в новую группу')
  end
end
