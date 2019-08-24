package a1


import "testing"
import "fmt"



func TestStackerTest(n *testing.T){

	fmt.Println("Part_1 (StackSlice)")
    s :=makeStackSlice()
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
    fmt.Println("________________________________________")
   
    fmt.Println("Part_2 (StackLinked)")
    t :=makeStackLinked()
    t.push(4)
    t.push(3)
    t.push(5)
    fmt.Println("Original = ", t)
    fmt.Println("Copy = " ,t.copy())
    fmt.Println(t.isEmpty())
    fmt.Println("Size = " ,t.size())
    fmt.Println( t.peek())
    fmt.Println(t.pop())
    t.push(10)
    fmt.Println("Original = ", t)
    fmt.Println("________________________________________")
    
    fmt.Println("Part_3_ (Popall and Stackequal)")
    stackEquals(s,t)
    popAll(t) 
    fmt.Println(t, " - Is the empty stack")
    fmt.Println("________________________________________")

	
	
    



}




