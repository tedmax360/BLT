// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    struct Student {
        uint256 id;
        string name;
        uint256 age;
        mapping(string => uint256) marks; // Mapping to hold marks for each subject
    }

    Student[] public students;

    fallback() external payable {
        revert("Fallback: Function does not exist");
    }

    receive() external payable {}

    // Function to add a student
    function addStudent(string memory _name, uint256 _age) public {
        uint256 studentId = students.length; // Assign ID based on current array length
        students.push(); // Create space for the new student
        Student storage newStudent = students[studentId]; // Reference to the new student
        newStudent.id = studentId;
        newStudent.name = _name;
        newStudent.age = _age;
    }

    // Function to set marks for a student
    function setMarks(uint256 _studentId, string memory _subject, uint256 _marks) public {
        require(_studentId < students.length, "Student ID does not exist."); // Ensure ID is valid
        students[_studentId].marks[_subject] = _marks; // Set marks for the specified subject
    }

    // Function to get marks for a specific subject
    function getMarks(uint256 _studentId, string memory _subject) public view returns (uint256) {
        require(_studentId < students.length, "Student ID does not exist."); // Ensure ID is valid
        return students[_studentId].marks[_subject]; // Return marks for the specified subject
    }

    // Function to retrieve student details by ID
    function getStudent(uint256 _id) public view returns (uint256, string memory, uint256) {
        require(_id < students.length, "Student ID does not exist."); // Ensure ID is valid
        Student storage student = students[_id]; // Reference to the student in storage
        return (student.id, student.name, student.age); // Return student details
    }

    // Function to get the total number of students
    function getTotalStudents() public view returns (uint256) {
        return students.length;
    }
}










/**
This Solidity smart contract, StudentData, is designed to store and manage information about students, including their details (like name and age) and marks 
for different subjects. The contract allows adding new students, assigning marks, retrieving student details, and querying the number of students stored.

Let’s break down each part of the contract:

1. License Declaration:
solidity
Copy code
// SPDX-License-Identifier: MIT
This line specifies that the contract is licensed under the MIT license, allowing others to use, modify, and distribute it.

2. Pragma Directive:
solidity
Copy code
pragma solidity ^0.8.0;
This line sets the version of Solidity that this contract is compatible with. The ^0.8.0 indicates that the contract will work with Solidity version 0.8.0 
or higher (but not the next major version).


3. Contract Declaration:
solidity
Copy code
contract StudentData {
This line defines the contract StudentData, which will contain the functions and data related to students.


4. Student Struct:
solidity
Copy code
struct Student {
    uint256 id;
    string name;
    uint256 age;
    mapping(string => uint256) marks; // Mapping to hold marks for each subject
}
Student is a custom data structure (or struct) that represents each student.
id: A unique identifier for each student.
name: The name of the student.
age: The age of the student.
marks: A mapping that holds the marks for each subject. The key is a string representing the subject name (e.g., "Math", "Science"), and the value is 
a uint256 representing the marks for that subject.


5. State Variable - students:
solidity
Copy code
Student[] public students;
students is a dynamic array of Student structs. It stores all the students added to the contract.
The public keyword makes this array accessible externally, and Solidity will automatically create a getter function for it, allowing external contracts 
or accounts to access the list of students.


6. Fallback Function:
solidity
Copy code
fallback() external payable {
    revert("Fallback: Function does not exist");
}
The fallback function is called when a transaction is sent to the contract without any data or if the function called does not exist in the contract.
It simply reverts the transaction with a message: "Fallback: Function does not exist". This prevents accidental or incorrect function calls.


7. Receive Function:
solidity
Copy code
receive() external payable {}
The receive function is executed when the contract receives ether without data (e.g., simple transfers). The function is marked payable to allow the contract 
to accept ether. This function does not perform any actions; it simply allows ether to be received into the contract.


8. addStudent Function:
solidity
Copy code
function addStudent(string memory _name, uint256 _age) public {
    uint256 studentId = students.length; // Assign ID based on current array length
    students.push(); // Create space for the new student
    Student storage newStudent = students[studentId]; // Reference to the new student
    newStudent.id = studentId;
    newStudent.name = _name;
    newStudent.age = _age;
}
addStudent allows anyone to add a new student to the contract.
studentId is assigned based on the current length of the students array (i.e., each new student gets a unique ID starting from 0).
students.push() creates space in the array for the new student.
A reference to the new student is obtained using Student storage newStudent = students[studentId], which allows us to modify the student's details.
The student's ID, name, and age are then set with the provided values.


9. setMarks Function:
solidity
Copy code
function setMarks(uint256 _studentId, string memory _subject, uint256 _marks) public {
    require(_studentId < students.length, "Student ID does not exist."); // Ensure ID is valid
    students[_studentId].marks[_subject] = _marks; // Set marks for the specified subject
}
setMarks allows setting marks for a specific subject for an existing student.
_studentId is the ID of the student whose marks are to be set.
The function checks if the provided student ID is valid (i.e., it exists in the students array) using the require statement.
The student's marks for the specified subject (_subject) are updated in the marks mapping.


10. getMarks Function:
solidity
Copy code
function getMarks(uint256 _studentId, string memory _subject) public view returns (uint256) {
    require(_studentId < students.length, "Student ID does not exist."); // Ensure ID is valid
    return students[_studentId].marks[_subject]; // Return marks for the specified subject
}
getMarks allows anyone to retrieve the marks of a student for a specific subject.
The function checks if the student ID is valid.
The function returns the marks stored in the marks mapping for the specified subject.


11. getStudent Function:
solidity
Copy code
function getStudent(uint256 _id) public view returns (uint256, string memory, uint256) {
    require(_id < students.length, "Student ID does not exist."); // Ensure ID is valid
    Student storage student = students[_id]; // Reference to the student in storage
    return (student.id, student.name, student.age); // Return student details
}
getStudent allows anyone to retrieve the details of a student by their ID.
It ensures the provided ID exists in the students array.
The function returns the ID, name, and age of the student.


12. getTotalStudents Function:
solidity
Copy code
function getTotalStudents() public view returns (uint256) {
    return students.length;
}
getTotalStudents returns the total number of students currently in the contract.
This is simply the length of the students array.


Summary of Functions:
addStudent: Adds a new student with a name and age.
setMarks: Sets marks for a specific subject of a student.
getMarks: Retrieves marks for a specific subject of a student.
getStudent: Retrieves details (ID, name, age) of a student by ID.
getTotalStudents: Returns the total number of students in the contract.

Example Scenario:
Add a student: A user can call the addStudent function to add a student with a name and age.
Set marks: The user can then call setMarks to assign marks to specific subjects for that student.
Get student details: To retrieve the student’s information, the user can call getStudent or getMarks to get the student's data and marks.
Get total students: The user can use getTotalStudents to know how many students are in the system.
*/
