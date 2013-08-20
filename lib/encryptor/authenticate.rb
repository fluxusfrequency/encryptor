require 'digest/md5'
require 'io/console'

module Encryptor
  class Authenticator

    def initialize
      @encryptor = Encrypt.new
      @pkey = File.open('pkey.txt', "r").read
    end

    def authenticate_user
      puts "Please enter the secret password: "
      pwd_try = STDIN.noecho(&:gets)
      pwd_try_encrypted = @encryptor.encrypt(pwd_try, 1, 3, 5)
      pwd_try_md5 = Digest::MD5.hexdigest(pwd_try_encrypted)
      if pwd_try_md5 != @pkey
        puts "You have entered an incorrect password. Goodbye!"
        fail
      end
    end

    def change_password
      authenticate_user
      puts "Please enter a new password: "
      new_pwd = STDIN.noecho(&:gets)
      puts "Please enter again to confirm: "
      new_conf = STDIN.noecho(&:gets)
      if new_pwd != new_conf
        puts "Sorry, password and confirmation did not match. Please try again."
        change_password
      else
        @pkey = @encryptor.encrypt(new_pwd, 1, 3, 5)
        new_pkey = Digest::MD5.hexdigest(@pkey)
        writer = File.open('pkey.txt', "w")
        writer.write(new_pkey)
        writer.close
        puts "Password successfully updated."
      end
    end

  end
end
