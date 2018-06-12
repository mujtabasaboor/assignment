require_relative "e_record.rb"
require_relative "e_details.rb"	

e=[]
count = -1
print "Add an event (y/n)?\n"
check = gets.chomp

if check == "y"
	while (check == "y")
		count += 1
		e << EventRecord.add_event	
		print "Enter name of the Event\n"
		name = gets.chomp
		print "Enter date for the event (yy:mm:dd)\n"
		date = gets.chomp
		e[count].add_event_details(name,date)
		print "Event added\n"
		print "Do u wish to add another event(y/n)?"
		check = gets.chomp
	end
	
	print "Do u wish to view the events of a specific month(y/n)?"
	
	if gets.chomp =~ /y/
		print "Enter the required year\n"
		year = gets.chomp
		print "Enter the required month\n"
		month = gets.chomp
		EventRecord.events_for_given_month(year,month)	
	end
	
	print "Do u wish to view all events(y/n)?"
	
	if gets.chomp =~ /y/
		EventRecord.return_all_events
	end
	
	print "Do u wish to delete an event(y/n)?"
	
	if gets.chomp =~ /y/
		EventRecord.delete_event
		puts "Remaining Events"
		EventRecord.return_all_events
	end
	p "Thank You"
else
	p "Thank You"
end