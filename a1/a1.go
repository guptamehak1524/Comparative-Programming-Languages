// ASSIGNMENT 1
//MEHAK GUPTA
//301311972
// References-
// Class Notes , T.A. instructions
// StackOverflow.com
// Course Website
// Linked list in golang- http://www.golangprograms.com/golang-program-for-implementation-of-linked-list.html
// stack and Linked list - https://blog.john-pfeiffer.com/golang-interfaces-stack-linked-list-queue-map-set/

package a1
// importing functions
import (
    "fmt"
    "errors"
    "strconv"
    
)


//interface -definitions
type Stacker interface {

isEmpty() bool
push(x int)
size() int
peek() (int,error)
pop() (int,error)
copy() Stacker


}


//Slice implementation of the Stack
type StackSlice struct{
data []int

}

// error message used in pop and peek
var ErrEmptyStack = errors.New("a1.go :stack is empty")
 

func makeStackSlice() Stacker{
return &StackSlice{data:make([]int,0) }

}

func (s *StackSlice) push(x int) {
    s.data = append (s.data,x)
}



func (s *StackSlice) size() int{
    return len(s.data)
}

func (s *StackSlice) peek() (int, error) {
    if len(s.data)> 0{
    return s.data[len(s.data)-1], nil

}
return 0, ErrEmptyStack

}


func (s *StackSlice) String() string {
    Start := []byte{}
    space := ""
    for i := len(s.data) - 1; i >= 0; i-- {
        Start = append(Start, space...)
        Start = strconv.AppendInt(Start, int64(s.data[i]), 10)
        space = ". "
    }
    
    return string(Start)
 
}

func (s *StackSlice) isEmpty() bool{
if len(s.data) > 0{
    fmt.Println("The stack is not empty")
    return false

}
fmt.Println("The stack is empty")
return true

}

func(s *StackSlice) pop() (int,error) {
    if len(s.data)>0 {
        m := s.data[len(s.data)-1]
        s.data = s.data[:len(s.data) -1]
        return m,nil
    
    }
    return 0, ErrEmptyStack

}

func (s *StackSlice) copy() Stacker {
    tmp := make([]int,len(s.data))
    copy (tmp, s.data)
    return &StackSlice{tmp}

} 

//________________________________________
//________________________________________




type item struct {
    value int
    next *item
    
}

type StackLinked struct {
    top *item
    size1 int

}


//intializing new empty stack

func makeStackLinked() Stacker{

    s := &StackLinked{}
    s.size1 =0
    return s
}


func (s StackLinked) size() int {
    return s.size1
}

func (s *StackLinked) push(x int) {
    s.top= &item{next: s.top, value : x}
    s.size1++

}


func (s *StackLinked) pop() (int, error) {
    if s.size1 <= 0 {
        return 0, ErrEmptyStack

    }
    result := s.top.value
    s.top = s.top.next
    s.size1--
    return result, nil
}

func (s *StackLinked) peek() (int, error){
    if s.size1 > 0{
        result := s.top.value
        return result, nil
    
    }
    return 0, ErrEmptyStack

}

func (s *StackLinked) isEmpty() bool{
    if s.size1 > 0 {
        fmt.Println("The stacks is not empty")
        return false
    }
        fmt.Println("The stacks is empty")
        return true

}


func (s *StackLinked) copy() Stacker {
    copy1 := *s
    return &copy1

} 

func (s *StackLinked) String() string {
    Start := []byte{}
    new1 := s.top
    if new1 != nil {
        Start = strconv.AppendInt(Start, int64(new1.value), 10)
        for new1 = new1.next; new1 != nil; new1 = new1.next {
            Start = append(Start, ". "...)
            Start = strconv.AppendInt(Start, int64(new1.value), 10)
        }
    }
    
    return string(Start)
}



func stackEquals(s, t Stacker) bool {
    // if same object
    if s == t {
        fmt.Println("The stacks are equal")
        return true
    }
    //if size is same 
    n := s.size()
    if n != t.size() {
        fmt.Println("The stacks are not equal")
        return false
    }
    // copy the original to keep it safe from changes
    s = s.copy()
    t = t.copy()

 // pop 1 element at a time and compare with the element in the other stack
    for j := 0; j < n; j++ {
        x, _ := s.pop()
        y, _ := t.pop()
        if x != y {
            fmt.Println("The stacks not are equal")
            return false
        }
    }
    fmt.Println("The stacks are equal")
    return true
} 


func popAll(s Stacker) {

    for i:=0; s.size() > 0; i++{
        s.pop()
    }


}

func stackerTest(s Stacker) {
    s.push(4)
    s.push(3)
    s.push(5)
    fmt.Println("Original = ", s)
    fmt.Println("Copy = " ,s.copy())
    fmt.Println(s.isEmpty())
    fmt.Println("Size = " ,s.size())
    fmt.Println( s.peek())
    fmt.Println(s.pop())
    s.push(10)
    fmt.Println("Original = ", s)


}


func main() {
    
   
    // can implement stackerTest but for convenience all the stackertest code is copied in a1_test.
    // A copy of the stackertest is kept here in case the files need to be used independantly
    
    
}







