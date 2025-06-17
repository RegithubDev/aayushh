package com.resustainability.reisp.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import com.nimbusds.jose.Payload;

public class Token {
	 public static void main(String[] args) {
	        String clientId = "180023549420-57imk7usicj28m4489imvf0spmk3v7l7.apps.googleusercontent.com"; // Replace with your actual client ID
	        String idToken = "104440232495267656131"; // Replace with the actual ID token

	        boolean isValid = checkToken(clientId, idToken);
	        if (isValid) {
	            System.out.println("Token is valid");
	        } else {
	            System.out.println("Token is not valid");
	        }
	    }

	    private static boolean checkToken(String clientId, String idToken) {
	        try {
	            GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(), new GsonFactory())
	                    .setAudience(Collections.singletonList(clientId))
	                    .build();

	            GoogleIdToken token = verifier.verify(idToken);
	            if (token != null) {
	                com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload payload = token.getPayload();
	                // You can access the token's claims and verify additional information as needed
	                // For example, you can check the token's expiration time by calling payload.getExpirationTime()

	                return true; // Token is valid
	            }
	        } catch (GeneralSecurityException | IOException e) {
	            e.printStackTrace();
	        }

	        return false; // Token is not valid
	    }
}
