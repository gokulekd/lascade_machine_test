import 'package:flutter/material.dart';

const darkThemeColor = Color(0xFF181922);
const colorNavBar = Color(0xFF10101B);
const shadowColor = Color(0xFF242634);

const logoGradient = LinearGradient(
                            colors: [
                              Color.fromARGB(255, 5, 48, 101),
                              Color.fromARGB(255, 10, 132, 173)
                            ], // Define your gradient colors
                            begin: Alignment
                                .topLeft, // Specify the gradient start point
                            end: Alignment
                                .bottomRight, // Specify the gradient end point
                          );

                          
const shadowNightGradient = LinearGradient(
                            colors: [
                              Color.fromARGB(255, 16, 16, 17),
                              Color.fromARGB(255, 49, 53, 54)
                            ], // Define your gradient colors
                            begin: Alignment
                                .topLeft, // Specify the gradient start point
                            end: Alignment
                                .bottomRight, // Specify the gradient end point
                          );