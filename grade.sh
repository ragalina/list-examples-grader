# Create your grading script here

set -e

CPATH="student-submission/ListExamples.java"
JUNITPATH=".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"

rm -rf student-submission
git clone $1 student-submission

if [[ ! -f $CPATH ]]
then
    echo "ListExamples.java wasn't found :("
    exit
else 
    echo "student-submission was cloned successfully :)"
fi

set +e 

cp TestListExamples.java student-submission
cd student-submission

javac -cp $JUNIT_PATH *.java 2> juniterr.txt

if [[ $? -eq 0 ]]
then
    echo "Compilation was a success :)"
else
    echo "ListExamples.java failed to compile :/"
    exit
fi

java -cp $JUNIT_PATH org.junit.runner.JUnitCore TestListExamples 2> junitout.txt

if [[ $? -ne 0 ]]
then
    echo "Some tests failed :,("
    FAILURE=$(grep "Failures: " junitout.txt)
    SCORE=$((5-$FAILURE))
    echo $SCORE "/5"
else
    echo "All tests passed!"
    echo "Score: 5/5 :)"
fi