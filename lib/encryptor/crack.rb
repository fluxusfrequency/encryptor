module Encryptor
  class Crack

  def initialize
    @cipher = Cipher.new
  end

  def supported_characters
    (' '..'z').to_a
  end

  def crack_decrypt_letter (letter, rotation)
    cipher_for_rotation = @cipher.cipher(-rotation)
    cipher_for_rotation[letter]
  end

  def crack_decrypt(string, rotation)
    letters = string.split("")
    results = letters.collect do |letter|
      crack_decrypt_letter(letter, rotation)
    end
    results.join
  end

  def crack(message)
    supported_characters.count.times.collect do |attempt|
      crack_decrypt(message,attempt)
    end
  end

  end
end
