# Calculator Project with Jenkins Integration

## Overview
This project is a simple calculator application developed using Java and Spring Boot. It is designed to demonstrate the basic functionalities of a calculator, including addition, subtraction, multiplication, and division. The project also showcases the integration with Jenkins for continuous integration and delivery (CI/CD), making it an excellent starting point for learning Jenkins.

## Features
- Perform basic arithmetic operations: addition, subtraction, multiplication, and division.
- RESTful API endpoints for each operation.
- Spring Boot framework for easy project setup and management.
- Maven for project building and dependencies management.
- Jenkins integration for automating build, test, and deployment processes.

## Prerequisites
Before you begin, ensure you have met the following requirements:
- Java JDK 11 or newer installed.
- Maven installed.
- Jenkins installed and configured.
- Git installed for version control.

## Getting Started
To get a local copy up and running, follow these simple steps:

1. **Clone the repository**
   ```sh
   git clone https://github.com/NCherfaoui/projet-prepa-competences.git
   ```

2. **Navigate to the project directory**
   ```sh
   cd projet-prepa-competences
   ```

3. **Build the project**
   ```sh
   ./mvnw clean install
   ```

4. **Run the application**
   ```sh
   ./mvnw spring-boot:run
   ```

The application should now be running and accessible locally.

## Using the Application
Access the calculator functionalities through the following RESTful endpoints:

- Addition: `GET /calculator/add?a={num1}&b={num2}`
- Subtraction: `GET /calculator/subtract?a={num1}&b={num2}`
- Multiplication: `GET /calculator/multiply?a={num1}&b={num2}`
- Division: `GET /calculator/divide?a={num1}&b={num2}`

Replace `{num1}` and `{num2}` with the numbers you wish to calculate.

## Jenkins Integration
The `Jenkinsfile` included in the project root directory outlines the pipeline for continuous integration, including stages for checkout, build, test, and package. To use this pipeline:

1. **Create a new Jenkins job** and select "Pipeline" as the job type.
2. **Configure the source code management** to point to the project's repository.
3. **Paste the contents of the `Jenkinsfile`** into the Pipeline script section.

Run the job to automate the build, test, and packaging of the application.

## Contributing
Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License
Distributed under the MIT License. See `LICENSE` for more information.



Project Link: [https://github.com/NCherfaoui/jenkins-first-project](https://github.com/NCherfaoui/jenkins-first-project)
