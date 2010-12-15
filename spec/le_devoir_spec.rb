require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "LeDevoir" do
  it "fails if no arguments are passed" do
    expect { LeDevoir.new }.to raise_error(ArgumentError)
  end
  
  it "should build a filename whose name contains only the date when the original filename's last directory is 'edition-pdf'" do
    le_devoir = LeDevoir.new(:password => "foo", :email => "bar", :path => "/path/to/files")
    le_devoir.build_filename("http://www.ledevoir.com/edition-pdf/2010-12-15.pdf").should eql("/path/to/files/2010-12-15.pdf")
  end
  
  it "should build a filename whose name contains only the date when the original filename's last directory is not 'edition-pdf'" do
    le_devoir = LeDevoir.new(:password => "foo", :email => "bar", :path => "/path/to/files")
    le_devoir.build_filename("http://www.ledevoir.com/culture/2010-12-15.pdf").should eql("/path/to/files/2010-12-15-culture.pdf")
  end
end
