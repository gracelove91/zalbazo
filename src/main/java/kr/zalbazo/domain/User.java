package kr.zalbazo.domain;

import java.time.LocalDate;

public class User {

    private Long id;
    private String name;
    private String email;
    private String password;
    private Long tel;
    private String address;

    private LocalDate joinDate;
    private LocalDate lastLogin;
}

