// GENERATED

/* INSTRUCTIONS
 *
 * Complete the exercises below.  For each "EXERCISE" comment, add
 * code immediately below the comment.
 *
 * Please see README.md for instructions, including compilation and testing.
 * 
 * GRADING
 * 
 * 1. Submissions MUST compile using SBT with UNCHANGED configuration and tests with no
 *    compilation errors.  Submissions with compilation errors will receive 0 points.
 *    Note that refactoring the code will cause the tests to fail.
 *
 * 2. You MUST NOT edit the SBT configuration and tests.  Altering it in your submission will
 *    result in 0 points for this assignment.
 *
 * 3. You may declare auxiliary functions if you like.
 *
 * SUBMISSION
 *
 * 1. Push your local repository to the repository created for you on GitHub before the deadline.
 *
 * 2. Late submissions will not be permitted because solutions will be discussed in class.
 * 
 */

object subtyping {

  // Instances of Counter have a integer field that can be incremented, decremented, or read.
  class Counter {
    private var n = 0
    def increment () = { n = n + 1 }
    def decrement () = { n = n - 1 }
    def get () : Int = n
  }

  // EXERCISE 1: complete the following function.
  // The observeCounter function has one parameter f: a function that accepts (a reference to) a Counter instance but returns nothing.
  // The observeCounter function should call f with (a reference to) an object (of a class extending Counter).
  // Your class that extends Counter must keep track of the total number of times that increment/decrement have been called.
  // I.e., if the increment method is called 3 times on an instance, and the decrement method is called 2 times on the same instance, then it should store 5  (somewhere other than the existing field n).
  // observeCounter should call f, and then return the total number of times that increment/decrement were called on the instance by f.
  def observeCounter (f : Counter => Unit) : Int = {
    // TODO: Provide definition here.
    class C extends Counter {
      object cntr {
        var cnt = 0
      }

      val i = cntr
      override def increment () = {
        super.increment();
        i.cnt = i.cnt + 1
      }
      override def decrement () = {
        super.decrement();
        i.cnt = i.cnt + 1
      }
      override def get () : Int = i.cnt
    }
    val c = new C
    f(c)
    c.get()
  }

  // EXERCISE 2: complete the following function.
  // It is the same as observeCounter except that f has a parameter of type List[Counter] not Counter.
  // f will insist that the List[Counter] has length 3.
  // You must return a List[Int] not an Int.
  // The first element of the result List[Int] must correspond to the number of times that increment/decrement were called on the first element of type List[Counter], similarly for the second and third elements.
  def observeCounterList (f : List[Counter] => Unit) : List[Int] = {
    // TODO: Provide definition here.
    class C extends Counter {
      object cntr {
        var cnt = 0
      }

      val i = cntr
      override def increment () = {
        super.increment();
        i.cnt = i.cnt + 1
      }
      override def decrement () = {
        super.decrement();
        i.cnt = i.cnt + 1
      }
      override def get () : Int = i.cnt
    }
    val c: C = new C
    val d: C = new C
    val e: C = new C
    f(c::d::e::Nil)
    val cRes: Int = c.get()
    val dRes: Int = d.get()
    val eRes: Int  = e.get()
    cRes::dRes::eRes::Nil
  }

  // EXERCISE 3: complete the following function.
  // It is the same as observeCounterList except that f has a parameter of type Array[Counter] not List[Counter].
  // f will insist that the Array[Counter] has length 3.
  // You must return a Array[Int] not a List[Int].
  // The first element of the result Array[Int] must correspond to the number of times that increment/decrement were called on the first element of type Array[Counter], similarly for the second and third elements.
  def observeCounterArray (f : Array[Counter] => Unit) : Array[Int] = {
    // TODO: Provide definition here.
    class C extends Counter {
      object cntr {
        var cnt = 0
      }

      val i = cntr
      override def increment () = {
        super.increment();
        i.cnt = i.cnt + 1
      }
      override def decrement () = {
        super.decrement();
        i.cnt = i.cnt + 1
      }
      override def get () : Int = i.cnt
    }
    val c: C = new C
    val d: C = new C
    val e: C = new C
    val lst: List[Counter] = c::d::e::Nil
    f(lst.toArray)
    val cRes: Int = c.get()
    val dRes: Int = d.get()
    val eRes: Int  = e.get()
    val lst1: List[Int] = cRes::dRes::eRes::Nil
    lst1.toArray
  }
}

