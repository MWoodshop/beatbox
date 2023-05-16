Beat Box
========

### Learning Goals

*   Follow an interaction pattern
*   Write readable code that adheres to Ruby convention
*   Write tests
*   Distinguishing between classes and instances of those classes
*   Use and implement iteration or recursion techniques
*   Host code on Github

Overview
--------

In this project we’re going to do some silly things with sound. Specifically, we’re going to make a very basic drum machine program.

However to add some additional depth, let’s also use this project as a chance to explore one of the fundamental data structures in computer science – the Linked List.

### Drum Machine 101 – Making Sounds

Go into your Terminal and try this:

    $ say -r 500 "ding, dah, oom, oom, ding, oom, oom, oom, ding, dah, oom, oom, ding, dah, oom, oom, ding, dah, oom, oom "


Yeah. That’s what we’re looking for. Now try it from Ruby:

    $ pry
    > `say -r 500 "ding, dah, oom, oom"`


Note that the backticks allow you to run terminal commands from within Ruby.

The exact command that you need to run may differ based on what version of OS X you have installed on your computer. The commands above will work on 10.13.

### Linked Lists

Linked Lists are one of the most fundamental Computer Science data structures. A Linked List models a collection of data as a series of “nodes” which link to one another in a chain.

In a singly-linked list (the type we will be building) you have a **head**, which is a node representing the “start” of the list, and subsequent nodes which make up the remainder of the list.

The **list** itself can hold a reference to one thing – the head node.

Each node can hold a single element of data and a link to the next node in the list.

The last node of the list is often called its **tail**.

Using sweet ASCII art, it might look like this:

    List -- (head) --> ["hello" | -]-- (link) --> ["world" | -]-- (link) --> ["!" | ]


The three nodes here hold the data “hello”, “world”, and “!”. The first two nodes have links which point to other nodes. The last node, holding the data “!”, has no reference in the link spot. This signifies that it is the end of the list.

In other lower level languages, something called a pointer is what is used to ensure that a single link knows about the next link. In Ruby, we don’t use pointers, so the link is literally its node. When we get to a node which is the last node, we call it the tail, and its link is nil.

A linked list should be able to do the following:

*   Insert elements
*   Pop an element from the end
*   Push an element onto the beginning
*   Remove the (first occurance

    all occurances) of an element by data content

*   Remove an element by position
*   Add an element at an arbitrary position
*   Add an element after a known node
*   Find whether a data element is or is not in the list
*   Find the distance between two nodes

Tips
----

*   A linked list is not an array. While it may perform many of the same functions as an array, its structure is conceptually very different.
*   There are only 3 types of “state” that need to be tracked for a linked list – the head of the list, the data of each node, and the “next node” of each node.
*   In object-oriented programming, “state” is generally modeled with instance variables
*   There are two main ways to implement Linked Lists: **iteration** and **recursion**. Iterative solutions use looping structures (`while`, `for`) to walk through the nodes in the list. Recursive solutions use methods which call themselves to walk through nodes. It would be ideal to solve it each way.
*   Most of your methods will be defined on the `List` itself, but you will need to manipulate one or more `Node`s to implement them.
*   **TDD** will be your friend in implementing the list. Remember to start small, work iteratively, and test all of your methods.
*   An **empty** list has `nil` as its head.
*   The **tail** of a list is the node that has `nil` as its next node.

Constraints
-----------

*   Make sure that your code is well tested for both _expected cases_ and _edge cases_. Try popping more elements than there are in the list. Try seeing if an empty list includes anything. Try inserting elements at a position beyond the length of the list.
*   Avoid using other ruby collections (Arrays, Hashes, etc) for the storage of your beats. That’s where you’re supposed to use the linked list. But having Arrays elsewhere in your code, or using methods that return arrays (like `.split`) are totally ok.

Resources
---------

Need some help on Linked Lists? You can check out some of the following resources:

*   https://www.youtube.com/watch?v=oiW79L8VYXk
*   http://www.sitepoint.com/rubys-missing-data-structure/

Requirements
------------

*   [Setup](#setup)
*   [Project Requirements](#project-requirements)
*   [Evaluation Rubric](#rubric)



Setup
================

_[Back to Beat Box Home](#beat-box)_

Repository Setup
----------------

You will create this repository from scratch. You should also host this repository on Github and use commits, branching, and pull requests. Like other project code we’ve seen so far, you should have a `lib` directory for your classes and a `spec` directory for your tests.

Project Requirements
=======================

_[Back to Beat Box Home](#beat-box)_

In order to help you to organize your project, we have broken the requirements into four separate iterations. It is expected that you will complete iterations 1-3, while 4 includes extensions that represent opportunities to further explore.

*   [Iteration 1](#iteration-1)
*   [Iteration 2](#iteration-2)
*   [Iteration 3](#iteration-3)
*   [Iteration 4](#iteration-4)

In addition to the functionality outlined in these iterations, we will expect the you to do the following:

*   write tests for each class
*   write readable code
*   make frequent commits
*   use pull requests

For more detailed information about what we expect, please review the [rubric](./rubric) before starting this project!

Submission
----------

You will submit this project using a Google Form linked in the Project Due calendar event on the Module 1 calendar.

Iteration 1
===========

Node Basics
-----------

Our Linked List will ultimately be composed of individual nodes, so in this iteration we’ll start with building out these nodes. Note that they are quite simple – a Node simply needs to have a slot for some data and a slot for a “next node”. Eventually this `next_node` position will be what we use to link the multiple nodes together to form the list.

For this iteration, build a simple node class that can perform these functions:

    > require "./lib/node"
    > node = Node.new("plop")
    > node.data
    => "plop"
    > node.next_node
    => nil


Append, To String, and Count (Single Node / Element)
----------------------------------------------------

Great! We have nodes. In this iteration we’ll create the `LinkedList` class and start filling in the basic functionality needed to append our _first node_.

We’ll be adding the following methods:

1.  `append` - adds a new piece of data (data can really be anything) to the list
2.  `count` - tells us how many things are in the list
3.  `to_string` - generates a string of all the elements in the list, separated by spaces

But for now, focus on building these functions so they work for just the **first** element of data appended to the list (we’ll handle multiple elements in the next iteration).

Expected behavior:

    > require "./lib/linked_list"
    > require "./lib/node"

    > list = LinkedList.new
    => <LinkedList head=nil #45678904567>
    > list.head
    => nil
    > list.append("doop")
    => "doop"
    > list
    => <LinkedList head=<Node data="doop" next_node=nil #5678904567890> #45678904567>
    > list.head.next_node
    => nil
    > list.count
    => 1
    > list.to_string
    => "doop"


Append, All/To String, and Insert (Multiple Nodes)
--------------------------------------------------

Now that we can insert the first element of our list (i.e. the Head), let’s focus on supporting these operations for multiple elements in the list.

This iteration is really where we’ll build out the core structure that makes up our linked list – it will probably take you more time than the previous iterations.

Update your `append`, `count`, and `to_string` methods to support the following interaction pattern:

    > require "./lib/linked_list"
    > require "./lib/node"

    > list = LinkedList.new
    => <LinkedList head=nil #45678904567>
    > list.head
    => nil
    > list.append("doop")
    => "doop"
    > list
    => <LinkedList head=<Node data="doop" next_node=nil #5678904567890> #45678904567>
    > list.head
    => <Node data="doop" next_node=nil #5678904567890>
    > list.head.next_node
    => nil
    > list.append("deep")
    => "deep"
    > list.head.next_node
    => <Node data="deep" next_node=nil #5678904567890>
    > list.count
    => 2
    > list.to_string
    => "doop deep"


Notice the key point here – the first piece of data we append becomes the Head, while the second becomes the Next Node of that (Head) node.

Iteration 2
===========

Additional Methods - `insert` and `prepend`
-------------------------------------------

Now we have nodes and a `LinkedList` class that manages the list. Next step is to add the `insert` and `prepend` methods.

`prepend` will add nodes to the beginning of the list.

`insert` will insert one or more elements at a given position in the list. It takes two parameters, the first one is the position at which to insert nodes, the second parameter is the string of data to be inserted.

Expected behavior:

    > require "./lib/linked_list"
    > require "./lib/node"

    > list = LinkedList.new
    > list.append("plop")
    => "plop"
    > list.to_string
    => "plop"
    > list.append("suu")
    => "suu"
    > list.prepend("dop")
    => "dop"
    > list.to_string
    => "dop plop suu"
    > list.count
    => 3
    > list.insert(1, "woo")
    => "woo"
    list.to_string
    => "dop woo plop suu"




Additional Methods - `find`, `pop`, `includes?`
-----------------------------------------------

Perfect, we are almost there! Next is to add `find`, `pop` and `includes?` methods.

`find` takes two parameters, the first indicates the first position to return and the second parameter specifies how many elements to return.

`includes?` gives back true or false whether the supplied value is in the list.

`pop` removes elements the last element from the list.

Expected behavior:

    ....
    > list.to_string
    => "deep woo shi shu blop"
    > list.find(2, 1)
    => "shi"
    > list.find(1, 3)
    => "woo shi shu"
    > list.includes?("deep")
    => true
    > list.includes?("dep")
    => false
    > list.pop
    => "blop"
    > list.pop
    => "shu"
    > list.to_string
    => "deep woo shi"



Iteration 3
===========

Creating the BeatBox Linked List “Wrapper”
------------------------------------------

Awesome! We have built most of our program and now it’s time to wrap the Linked List logic in a `BeatBox` class.

When we create a new instance of the `BeatBox` class, a `LinkedList` object is also instantiated and available as an attribute on the `BeatBox` instance. Now, we can manage our linked list through the `BeatBox` class.

Up until now, we have only been able to `append` and `prepend` a single node at a time. The LinkedList class hasn’t formatted the data it received, consequently, passing the string “deep bop dop” to `append` has resulted in _one_ node created with data `deep bop dop`. With `BeatBox` as an extra layer, it can take care of properly formatting the data (eg: splitting the string) before passing it down to the `LinkedList`. This implementation results in _three_ nodes appended to the list if we pass the string “deep bop dop” to `BeatBox#append`.

Expected behavior:

    > require "./lib/beat_box"
    > require "./lib/linked_list"
    > require "./lib/node"

    > bb = BeatBox.new
    => <BeatBox list=<LinkedList head=nil #234567890890> #456789045678>
    > bb.list
    => <LinkedList head=nil #234567890890>
    > bb.list.head
    => nil
    > bb.append("deep doo ditt")
    => "deep doo ditt"
    > bb.list.head.data
    => "deep"
    > bb.list.head.next_node.data
    => "doo"
    > bb.append("woo hoo shu")
    => "woo hoo shu"
    > bb.count
    6




Playing Beats
-------------

Now that we have our BeatBox class put together using the internal Linked List to keep track of our beats, let’s use it to actually play the beats.

Remember that, at the command line, we can play sounds using the `say` command:

    $ say -r 500 -v Boing "ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom "


It turns out we can also easily issue this command (or any other system command) from ruby by using backticks: \`\`\`.

For example:

    $ pry
    > `say -r 500 -v Boing "ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom "`


Additionally, we can use standard string interpolation (`#{}`) to pass dynamic content into a system command:

    $ pry
    > beats = "ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom "
    > `say -r 500 -v Boing #{beats}`


For this final section, add a `play` method to your BeatBox class that will generate the string content of the Beat and use it as input to the `say` command.

    > require "./lib/beat_box"
    > require "./lib/linked_list"
    > require "./lib/node"

    > bb = BeatBox.new
    => <BeatBox list=<LinkedList head=nil #234567890890> #456789045678>
    > bb.append("deep doo ditt woo hoo shu")
    => "deep doo ditt woo hoo shu"
    > bb.count
    => 6
    > bb.list.count
    => 6
    > bb.play
    => # plays the sounds deep doo ditt woo hoo shu


Iteration 4 - Extensions
========================

### 1\. Validating Beats

There are a lot of words which aren’t going to work for beats. Like `Mississippi`.

Add validation to your program such that the input beats must be members of your defined list. Insertion of a beat not in the list is rejected. Like this:

    > bb = BeatBox.new("deep")
    > bb.append("Mississippi")
    > bb.all
    => "deep"
    > bb.prepend("tee tee tee Mississippi")
    > bb.all
    => "tee tee tee deep"


Here’s a starter list of valid beats, but add more if you like:

    tee dee deep bop boop la na


### 2\. Speed & Voice

Let’s make it so the user can control the voice and speed of playback. You may not have all the voices referenced here available on your machine. You can check which voices you have by following the steps documented [here](https://support.apple.com/guide/mac-help/change-the-voice-your-mac-uses-to-speak-text-mchlp2290/mac).

Originally we showed you to use `say -r 500 -v Boing` where `r` is the rate and `v` is the voice. Let’s setup a usage like this:

    > bb = BeatBox.new("deep dop dop deep")
    > bb.play
    => 4 # plays the four sounds normal speed with Boing voice
    > bb.rate = 100
    => 100
    > bb.play
    => 4 # plays the four sounds slower with Boing voice
    > bb.voice = "Daniel"
    => "Daniel"
    > bb.play
    => 4 # plays the four sounds slower with Daniel voice
    > bb.reset_rate
    => 500
    > bb.reset_voice
    => "Boing"
    > bb.play
    => 4 # plays the four sounds normal speed with Boing voice


Rubric
===============

_[Back to Beat Box Home](#beat-box)_

Learning Goals
--------------

*   Follow an interaction pattern
*   Write readable code that adheres to Ruby convention
*   Write tests
*   Distinguishing between classes and instances of those classes
*   Use and implement iteration or recursion techniques
*   Host code on Github





**Exceeds Expectations**

**Meets Expectations**

**Approaching Expectations**

**Below Expectations**

**Functionality**

Complete both extensions of iteration 4.

Complete through Iteration 3 and functions as defined by the project requirements.

Up to Iteration 2 is complete or the application does not exactly follow the requirements outlined in the specification.

Iteration 2 is not complete.

**Ruby Mechanics**

Project includes appropriate uses of datatypes and methods not covered in class

Appropriately uses Ruby’s built in datatypes and methods and flow control.

Does not appropriately use one or two of the following: Ruby’s built in datatypes and methods or flow control

Does not appropriately use Ruby’s built in datatypes and methods or flow control, or does not build classes

**Ruby Conventions**

Classes, methods, and variables are well named so that they clearly communicate their purpose. Code is all properly indented and syntax is consistent.

Code is mostly properly indented, spaced, and lines are not excessively long. Class, method, variable, and file names follow convention

Code demonstrates some proper indenting and spacing. Class, method, variable, and file names inconsistently follow convention

Code is not properly indented and spaced and lines are excessively long. Class, method, variable, and file names do not follow convention

**Testing**

All methods are accurately tested. Best use assertions are made. Edge cases are tested.

Each class has its own test file. Every method listed on the specification is tested. Most tests are written to accurately verify expected behavior.

Tests are written for most methods listed on the specification, but the tests may be in an incorrect location or the tests may not accurately verify the expected behavior

Fewer than 7 tests written

**Version Control**

At least 30 commits. At least 3 pull requests. Commit messages and Pull Request documentation clearly indicate changes made.

Code is hosted on main branch of Github repository. At least 20 commits. At least 1 pull request.

Code is hosted on Github, but has fewer than 20 commits or has no pull requests

Code is not hosted on Github
