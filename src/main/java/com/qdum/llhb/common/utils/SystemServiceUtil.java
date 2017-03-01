package com.qdum.llhb.common.utils;

import com.qdum.llhb.common.security.Digests;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

public class SystemServiceUtil {
	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	public static final int SALT_SIZE = 8;
	
	/**
	 * 生成安全的密码，生成随机的16位salt并经过1024次 sha-1 hash
	 */
	public static String entryptPasswordOld(String plainPassword) {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
        System.out.println("salt="+salt);
        byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), salt, HASH_INTERATIONS);
        System.out.println("hashPassword="+hashPassword);
        System.out.println("Encodes.encodeHex:" + Encodes.encodeHex(salt));
        System.out.println("Encodes.encodeHex=" + Encodes.encodeHex(hashPassword) );
        return Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword);
	}

    public static String entryptPassword(String plainPassword) {
        byte[] salt = Digests.generateSalt(SALT_SIZE);
        SimpleHash hash = new SimpleHash(HASH_ALGORITHM,plainPassword.toCharArray(), ByteSource.Util.bytes(salt),HASH_INTERATIONS);
        return Encodes.encodeHex(salt) + hash;
    }

	/**
	 * 验证密码
	 * @param plainPassword 明文密码
	 * @param password 密文密码
	 * @return 验证成功返回true
	 */
	public static boolean validatePassword(String plainPassword, String password) {
		byte[] salt = Encodes.decodeHex(password.substring(0,16));
		byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), salt, HASH_INTERATIONS);
		return password.equals(Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword));
	}

    public static void main(String[] args) {
        System.out.println(entryptPassword("111111"));
    }

}
