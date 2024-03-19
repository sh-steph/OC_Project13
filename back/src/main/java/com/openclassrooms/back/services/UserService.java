package com.openclassrooms.back.services;

import com.openclassrooms.back.models.User;
import com.openclassrooms.back.payload.request.LoginRequest;
import com.openclassrooms.back.payload.request.RegisterRequest;
import com.openclassrooms.back.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;
import java.util.regex.Pattern;

@Service
@Transactional
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;
    public void register(RegisterRequest request) {
        String username = request.getUsername();
        Optional<User> existingUser = userRepository.findByUsername(username);
        if (existingUser.isPresent()) {
            throw new DuplicateKeyException(String.format("This Username '%s' already exists.", username));
        }
        String hashedPassword = passwordEncoder.encode(request.getPassword());
        User user = new User(username, hashedPassword, true);
        userRepository.save(user);
    }

    @Override
    public UserDetails loadUserByUsername(String value) throws UsernameNotFoundException {
        String regexPattern = "^(.+)@(\\S+)$";
        if (Pattern.compile(regexPattern).matcher(value).matches()) {
            User userFind = userRepository.findByUsername(value)
                    .orElseThrow(() -> new UsernameNotFoundException(value));
            return new User(
                    userFind.getId(),
                    userFind.getUsername(),
                    userFind.getPassword(),
                    userFind.getAdmin()
            );
        } else {
            User userFind = userRepository.findByUsername(value)
                    .orElseThrow(() -> new UsernameNotFoundException(value));
            return new User(
                    userFind.getId(),
                    userFind.getUsername(),
                    userFind.getPassword(),
                    userFind.getAdmin()
            );
        }
    }
}
