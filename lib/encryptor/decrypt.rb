module Encryptor
  class Decrypt

    def initialize
      @cipher = Cipher.new
    end

    def decrypt_letter (letter, rotation1, rotation2, rotation3)
      begin
        cipher_for_rotation1 = @cipher.cipher(-rotation1)
        cipher_for_rotation1[letter]
        cipher_for_rotation2 = @cipher.cipher(-rotation2)
        cipher_for_rotation2[letter]
        cipher_for_rotation3 = @cipher.cipher(-rotation3)
        cipher_for_rotation3[letter]
      rescue
        puts "There was a problem decrypting this message."
      end
    end

    def decrypt(string, rotation1 = @last_rotation1, rotation2 = @last_rotation2, rotation3 = @last_rotation3)
      begin
        letters = string.split("")
        results = letters.collect do |letter|
          decrypt_letter(letter, rotation1, rotation2, rotation3)
        end
        results.join
      rescue
        puts "There was a problem decrypting this message."
      end
    end

    def decrypt_file(filename, rotation1, rotation2, rotation3)
      file_in = File.open(filename, "r")
      decrypted_mojo = decrypt(file_in.read, rotation1, rotation2, rotation3)
      file_out = File.open("decrypted_#{filename}", "w")
      file_out.write(decrypted_mojo)
      file_out.close
    end

  end
end