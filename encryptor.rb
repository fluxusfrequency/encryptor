class Encryptor
  def cipher(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
  end

  def encrypt_letter (letter, rotation)
    cipher_for_rotation = cipher(rotation)
    cipher_for_rotation[letter]
  end

  def encrypt(string, rotation)
    letters = string.split("")
    results = letters.collect do |letter|
      encrypt_letter(letter, rotation)
    end
    results.join
  end

  def decrypt_letter (letter, rotation)
    cipher_for_rotation = cipher(-rotation)
    cipher_for_rotation[letter]
  end

  def decrypt(string, rotation)
    letters = string.split("")
    results = letters.collect do |letter|
      decrypt_letter(letter, rotation)
    end
    results.join
  end

  def encrypt_file(filename, rotation)
    file_in = File.open(filename, "r")
    encrypted_mojo = encrypt(file_in.read, rotation)
    file_out = File.open("encrypted_#{filename}", "w")
    file_out.write(encrypted_mojo)
    file_out.close
  end

  def decrypt_file(filename, rotation)
    file_in = File.open(filename, "r")
    decrypted_mojo = decrypt(file_in.read, rotation)
    file_out = File.open("decrypted_#{filename}", "w")
    file_out.write(decrypted_mojo)
    file_out.close
  end

  def supported_characters
    (' '..'z').to_a
  end

  def crack(message)
    supported_characters.count.times.collect do |attempt|
      decrypt(message,attempt)
    end
  end
end