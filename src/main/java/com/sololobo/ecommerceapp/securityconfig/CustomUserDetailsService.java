package com.sololobo.ecommerceapp.securityconfig;

import com.sololobo.ecommerceapp.domain.User;
import com.sololobo.ecommerceapp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@Service
public class CustomUserDetailsService implements UserDetailsService {
    @Autowired
    UserRepository userRepository;

    private Set<GrantedAuthority> getGrantedAuthorities(User user) {
        Set<GrantedAuthority> authorities = new HashSet<>();
            authorities.add(new SimpleGrantedAuthority(user.getRole().name()));
        return authorities;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Optional<User> userOp = userRepository.getUserByEmail(email);
        if (userOp.isPresent()) {
            User user = userOp.get();
            return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(),
                    true, true, true, true,
                    getGrantedAuthorities(user));
        }
        return null;
    }
}
