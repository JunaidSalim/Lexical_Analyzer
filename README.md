# Lexical Analyzer

This is our Formal Languages and Automata Theory Project. This repository contains a program for a Lexical Analyzer for C++ that will tokenize a C++ program.

## Installation and Usage

1. **Install Flex**

   Make sure Flex is installed on your system. You can download it from [Flex's official website](https://github.com/westes/flex) or install it using your package manager.

2. **Add Flex to Environment Variables**

   Ensure that the path to the Flex binary is added to your system's environment variables.

3. **Run Flex on the Lexer File**

   Use Flex to generate the C source file from the lexer definition file:

   ```sh
   flex lexer.l
   ```
   This command will generate a file named lex.yy.c.

4. **Compile the Generated C File**

   Compile the generated C file using GCC (or any C compiler):
   ```sh
   gcc lex.yy.c -o [outputFile]
   ```
5. **Run the Lexical Analyzer**

   Run the compiled executable with an input C++ file to tokenize it:

   ```sh
   ./[outputFile] [InputFile]
   ```
   Replace [outputFile] with the name of your executable and [InputFile] with the path to the C++ file you want to tokenize.

   The tokens will be printed in the terminal.

## Example

  Here's a quick example to demonstrate the steps:

  1. Install Flex and add it to your PATH.

  2. Create a file named lexer.l with your lexer definitions.

  3. Run Flex:
  ```sh 
  flex lexer.l
  ```
  4. Compile the generated C file:
  ```sh
  gcc lex.yy.c -o lexer
  ```
  5. Tokenize a C++ file:
  ```sh
  ./lexer input.cpp
  ```

## Contributors

- [Junaid Saleem](https://github.com/JunaidSalim)
- [Muneeb Bin Nasir](https://github.com/JMSNM)
