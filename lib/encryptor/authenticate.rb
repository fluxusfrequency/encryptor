require 'digest/md5'
require 'io/console'

module Encryptor
  class Authenticator

    def initialize
      @encryptor = Encrypt.new
    end

    def authenticate_user
      puts "Please enter the secret password: "
      pwd_try = STDIN.noecho(&:gets)
      pwd_try_encrypted = @encryptor.encrypt(pwd_try, 1, 3, 5)
      pkey = "ymzsijwhfyx"
      pkey_md5 = Digest::MD5.hexdigest(pkey)
      pwd_try_md5 = Digest::MD5.hexdigest(pwd_try_encrypted)
      if pwd_try_md5 != pkey_md5
        puts "You have entered an incorrect password. Aborting."
        fail
      end
    end

  end
end
