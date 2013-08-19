module Encryptor
  class Encrypt

    def initialize
      @cipher = Cipher.new
    end

    def encrypt_letter (letter, rotation1, rotation2, rotation3)
      begin
        cipher_for_rotation1 = @cipher.cipher(rotation1)
        cipher_for_rotation1[letter]
        cipher_for_rotation2 = @cipher.cipher(rotation2)
        cipher_for_rotation2[letter]
        cipher_for_rotation3 = @cipher.cipher(rotation3)
        cipher_for_rotation3[letter]
      rescue
        puts "There was a problem encrypting this message."
      end
    end

    def encrypt(string, rotation1, rotation2, rotation3)
      begin
        letters = string.split("")
        results = letters.collect do |letter|
          encrypt_letter(letter, rotation1, rotation2, rotation3)
        end
        results.join
      rescue
        puts "There was a problem encrypting this message."
      end
    end

    def encrypt_file(filename, rotation1, rotation2, rotation3)
      file_in = File.open(filename, "r")
      encrypted_mojo = encrypt(file_in.read, rotation1, rotation2, rotation3)
      file_out = File.open("encrypted_#{filename}", "w")
      file_out.write(encrypted_mojo)
      file_out.close
    end

  end
end