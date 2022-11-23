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

set +e 

# inspired by https://github.com/phuanh004/list-examples-grader
mkdir student-submission/lib
cp lib/* student-submission/lib
cp *.java student-submission

cd student-submission


# javac TestListExamples.java 2> output-test.txt
# java TestListExamples

# if [[ ! $? -ne 0 ]]
# then
#     echo "ListExamples.java failed some tests"
#     cat output.txt
#     exit
# fi

# javac ListExamples.java TestListExamples.java 2> output.txt
# java ListExamples TestListExamples

# if [[ ! $? -ne 0 ]]
# then
#     echo "ListExamples.java failed to compile :/"
#     cat output.txt
#     exit
# fi

javac -cp $JUNITPATH ListExamples.java TestListExamples.java 2> junitout.txt
java -cp $JUNITPATH org.junit.runner.JUnitCore ListExamples TestListExamples 2 > junitout.txt

if [[ ! $? -ne 0 ]]
then
    echo "ListExamples.java failed to compile :/"
   # cat junitout.txt
    exit
else
    echo "Everything looks good :)"
    exit
fi

