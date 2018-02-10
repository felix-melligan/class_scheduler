class UserDecorator
  include ActionView::Helpers::DateHelper

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def simple_decorate
    {
      :average_rating => average_rating,
      :client => @user.client?,
      :country => country,
      :email => email,
      :first_name => first_name,
      :languages => languages,
      :last_logged_in => last_logged_in,
      :locale => locale,
      :programs => programs,
      :rating_count => rating_count,
      :state => state,
      :thumbnail_image => picture,
      :timezone => user_timezone,
      :url_slug => url_slug,
      :volunteer => @user.volunteer?,
      :city => city
    }.merge(availabilities_hash)
  end

  def updateable
    {
        :programs => programs,
        :locale => locale,
        :address => address,
        :city => city,
        :country => country,
        :state => state,
        :client => @user.client?,
        :volunteer => @user.volunteer?,
        :email => email,
        :email_notification => email_notification,
        :first_name => first_name,
        :thumbnail_image => picture,
        :description => description,
        :timezone => user_timezone,
        :languages => languages,
    }
  end

  def availabilities_hash
    if @user.volunteer?
      {
          :available_days => available_days,
      }
    else
      { }
    end
  end

  def decorate
    {
        :address => address,
        :average_rating => average_rating,
        :city => city,
        :client => @user.client?,
        :country => country,
        :description => description,
        :email => email,
        :first_name => first_name,
        :languages => languages,
        :last_logged_in => last_logged_in,
        :locale => locale,
        :programs => programs,
        :rating_count => rating_count,
        :state => state,
        :thumbnail_image => picture,
        :timezone => user_timezone,
        :url_slug => url_slug,
        :volunteer => @user.volunteer?
    }.merge(availabilities_hash)
  end

  def email_notification
    user.email_notification || true
  end

  def locale
    user.locale || 'en'
  end

  def rating_count
    user.rating_count || 0
  end

  def average_rating
    user.average_rating || 0
  end

  def languages
    user.languages.pluck(:name)
  end

  def user_timezone
    user.timezone
  end

  def description
    user.description ||= ''
  end

  def url_slug
    user.url_slug
  end

  def first_name
    user.first_name
  end

  def email
    user.email
  end

  def picture
    if Rails.env.production?
      URI.join('https:' + user.thumbnail_image.url(:thumbnail)).to_s
    else
      URI.join(Rails.configuration.static_base_url, user.thumbnail_image.url(:thumbnail)).to_s
    end
  end

  def availabilities
    user.availabilities
  end

  def programs
    user.programs.pluck(:name)
  end

  def address
    user.address ||= ''
  end

  def city
    user.city ||= ''
  end

  def country
    user.country ||= ''
  end

  def state
    user.state ||= ''
  end

  def available_days
    availabilities.pluck(:day)
  end

  def last_logged_in
    time_ago_in_words(user.last_sign_in_at)
  end
end
