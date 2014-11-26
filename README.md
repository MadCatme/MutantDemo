# A little demo for mutation testing with mutant

## Requirements

Ruby 2 or newer. That's all.

## Setup

Just use `bundle install` and you're done.

## Usage

### Step 1

Checkout the master branch and run `bundle exec rspec spec` in your terminal.

All specs passed and 100% code coverage? Awesome! THE END.

Well, not really. Code coverage mains nothing.

### Step 2

Mutant will tell you what the specs are missing.

To keep things simple, just run Mutant for House#add_member:

Run `bundle exec mutant --include lib --require house --use spec 'House#add_member'` in your terminal.

You should get an output like this:

~~~
 rspec:House#add_member
evil:House#add_member:/Users/david/Sites/MutantDemo/lib/house.rb:29:d3866
@@ -1,5 +1,5 @@
 def add_member(member)
   @members.push(member)
-  self
+  nil
 end
-----------------------
evil:House#add_member:/Users/david/Sites/MutantDemo/lib/house.rb:29:dfb18
@@ -1,5 +1,4 @@
 def add_member(member)
   @members.push(member)
-  self
 end
-----------------------
Mutant configuration:
Matcher:            #<Mutant::Matcher::Config match_expressions=[<Mutant::Expression: House#add_member>] subject_ignores=[] subject_selects=[]>
Integration:        rspec
Expect Coverage:    100.00%
Jobs:               8
Includes:           ["lib"]
Requires:           ["house"]
Available Subjects: 1
Subjects:           1
Mutations:          16
Kills:              14
Alive:              2
Runtime:            0.50s
Killtime:           0.22s
Overhead:           126.59%
Coverage:           87.50%
Expected:           100.00%
~~~

Hmm, it's red and shows two mutations. What happend?

Mutant replaced the return value `self` of House#add_member with `nil` and the specs passed. The specs even passed when the return value was removed.

To fix it, we have to add a spec that asserts the return value of the method.

Now it's your turn.

You can jump to the solution by checking out the branch `add_member_kill_mutation`
