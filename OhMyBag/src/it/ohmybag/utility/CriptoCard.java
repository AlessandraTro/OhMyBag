package it.ohmybag.utility;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import java.security.spec.KeySpec;
import java.util.Base64;

public class CriptoCard {

    private static final String SECRET_KEY = "your_secret_key"; // Chiave segreta per AES (19 caratteri)
    private static final String SALT = "your_salt"; // Sale per AES (19 caratteri)

    // Funzione per crittografare le prime N cifre del numero di carta
    public static String encryptFirstNDigits(String cardNumber, int n) {
        try {
            String firstNDigits = cardNumber.substring(0, n);

            // Configura la chiave per AES
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            KeySpec spec = new PBEKeySpec(SECRET_KEY.toCharArray(), SALT.getBytes(), 65536, 256);
            SecretKey tmp = factory.generateSecret(spec);
            SecretKeySpec secretKey = new SecretKeySpec(tmp.getEncoded(), "AES");

            // Cifra le prime N cifre
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, new IvParameterSpec(new byte[16]));
            byte[] encrypted = cipher.doFinal(firstNDigits.getBytes());

            // Codifica il risultato in Base64 per una rappresentazione sicura in stringa
            return Base64.getEncoder().encodeToString(encrypted);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
