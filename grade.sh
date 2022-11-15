# Create your grading script here

set -e

CPATH="student-submission/ListExamples.java"
JUNITPATH=".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"

rm -rf student-submission
git clone $1 student-submission

if [[ ! -f $CPATH ]]
then
    echo "ListExamples.java wasn't found :("
    exit
fi

cp $CPATH ../list-examples-grader

set +e 

javac ListExamples.java TestListExamples.java 2> output.txt
java ListExamples TestListExamples 

if [[ ! $? = 0 ]]
then
    echo "ListExamples.java failed to compile :/"
    cat output.txt
    exit
fi

javac -cp $JUNITPATH TestListExamples.java 2> junitout.txt
java -cp $JUNITPATH org.junit.runner.JUnitCore TestListExamples 2> junitout.txt

if [[ ! $? = 0 ]]
then
    echo "There were issues with the junit tests :,("
    cat junitout.txt
    exit
fi

