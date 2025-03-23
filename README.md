# Advanced Calculator (JFlex & CUP)

## Overview
This project is an advanced calculator implemented using JFlex (Lexical Analyzer) and CUP (Parser Generator). It supports basic arithmetic operations, trigonometric functions, history tracking, and variable assignments. The calculator also includes a command-line interface with colored output for better readability.

## Features
- **Basic Operations**: Addition (+), Subtraction (-), Multiplication (*), Division (/), Modulus (%), and Power (^).
- **Trigonometric Functions**: sin(), cos(), tan().
- **Square Root**: sqrt().
- **Constant Support**: PI (π ≈ 3.14159).
- **Variable Assignment**: Assign values to variables (e.g., x = 10).
- **History Tracking**: Stores the last 10 calculations.
- **Command Handling**: EXIT to quit, CLEAR to reset history and variables, HISTORY to view recent calculations.
- **Error Handling**: Detects division by zero, invalid characters, and other errors.

## Installation & Setup
### Prerequisites
1. Java Development Kit (JDK) installed
2. JFlex installed
3. CUP installed

### Compilation Steps
1. Generate Lexer and Parser:
  ```
  jflex Calculator.jflex
  java -jar java-cup-11b.jar -parser CalculatorParser -symbols sym Calculator.cup
  ```
2. Compile the Java Files:
```
javac *.java
```
3. Run the Calculator:
```
java Calculator
```

## Usage
### Example Inputs
```
5 + 3 * 2
sin(PI / 2)
x = 10
y = x + 5
y * 2
HISTORY
CLEAR
EXIT
```

### Expected Outputs
```
➤ Result: 11
➤ Result: 1
📌 Variable x = 10
📌 Variable y = 15
➤ Result: 30
📜 Last 10 Calculations:
🗑  All variables and history cleared!
🚀 Exiting calculator... Goodbye!
```

## File Structure
- **Calculator.jflex**: Lexical analyzer definition.
- **Calculator.cup**: Parser definition.

## Contribution
Contributions are welcome! If you find bugs, have feature suggestions, or want to improve the code, feel free to open an issue or submit a pull request.

### Steps to Contribute
1. Fork the repository.
2. Create a new branch (git checkout -b feature-branch).
3. Make your changes and commit (git commit -m "Description of changes").
4. Push to your fork (git push origin feature-branch).
5. Open a pull request.

#### Happy coding! 🚀
