using System;

class Animal
{
    public String ownerName;


    public virtual void speak()
    {
        Console.WriteLine("The animal can speak");
    }

    public virtual void Test(int age)
    {
        Console.WriteLine("My age is " + age);
    }

    public virtual void Test(String name)
    {
        Console.WriteLine("My name is " + name);
    }

    public virtual void printOwnerName()
    {
        Console.WriteLine("My owner name is " + this.ownerName);
    }
}

class Human : Animal
{
    public override void speak()
    {
        //override superclass method
        Console.WriteLine("Human speak: Hi..(anything)");
    }
}

class Monkey : Animal
{
    public override void speak()
    {
        //override superclass method
        Console.WriteLine("Monkey speak: Hoop Hoop ");
    }
}

static class main
{
    static void Main()
    {

        Animal[] animals = new Animal[3]; //Creating the Animal List
        animals[0] = new Animal(); //Add a new animal object to the list
        animals[0].ownerName = "God / Allah ";

        animals[1] = new Human(); //Add a Human object to the list
        animals[1].ownerName = " Human's mother and father";

        animals[2] = new Monkey(); //Add a Monkey object to the list
        animals[2].ownerName = " Monkey's mother and father";

        //Dynamic polymorphism
        foreach (Animal a in animals)
        {
            a.speak(); //This statement prints the correct string no matter the class
            a.printOwnerName();
        }

        //Static polymorphism
        animals[1].Test(24);
        animals[1].Test("Vipul");
        Console.ReadLine();
    }
}