package Syntax::Kamelon::Format::ANSI;

use 5.006;
use strict;
use warnings;
use Carp;

use vars qw($VERSION);
$VERSION="0.15";

use base qw(Syntax::Kamelon::Format::Base);
use Term::ANSIColor;

my %themes = (

	black => {
		Alert => color('white bold on_green'),
		Annotation => color('red on_bright_white'),
		Attribute => color('bright_yellow bold'),
		BaseN => color('bright_green'),
		BuiltIn => color('yellow bold'),
		Char => color('cyan bold on_bright_yellow'),
		Comment => color('white bold on_bright_black'),
		CommentVar => color('green bold'),
		Constant => color('magenta bold'),
		ControlFlow => color('bright_blue bold on_yellow'),
		DataType => color('bright_blue bold'),
		DecVal => color('red bold'),
		Documentation => color('black on_bright_white'),
		Error => color('yellow bold on_red'),
		Extension => color('magenta on_blue'),
		Float => color('bright_red bold'),
		Function => color('bright_cyan'),
		Import => color('red on_white'),
		Information => color('blue on_bright_white'),
		Keyword => color('white bold'),
		Normal => color('white on_black'),
		Operator => color('green'),
		Others => color('cyan bold'),
		Preprocessor => color('bright_blue on_yellow'),
		RegionMarker => color('black on_yellow'),
		SpecialChar => color('blue on_bright_yellow'),
		SpecialString => color('red on_bright_yellow'),
		String => color('green on_bright_yellow'),
		Variable => color('bright_magenta'),
		VerbatimString  => color('bright_black on_bright_yellow'),
		Warning => color('green bold on_red'),
	},

	bright_black => {
		Alert => color('white bold on_green'),
		Annotation => color('red on_bright_white'),
		Attribute => color('bright_yellow bold'),
		BaseN => color('bright_green'),
		BuiltIn => color('yellow bold'),
		Char => color('cyan on_bright_yellow'),
		Comment => color('white bold on_bright_blue'),
		CommentVar => color('green bold'),
		Constant => color('magenta bold'),
		ControlFlow => color('blue bold on_yellow'),
		DataType => color('bright_yellow'),
		DecVal => color('red bold'),
		Documentation => color('black on_bright_white'),
		Error => color('yellow bold on_red'),
		Extension => color('magenta on_blue'),
		Float => color('bright_red bold'),
		Function => color('bright_cyan'),
		Import => color('red on_white'),
		Information => color('blue on_bright_white'),
		Keyword => color('white bold'),
		Normal => color('bright_white on_bright_black'),
		Operator => color('bright_magenta'),
		Others => color('cyan bold'),
		Preprocessor => color('bright_blue on_yellow'),
		RegionMarker => color('black on_yellow'),
		SpecialChar => color('blue on_bright_yellow'),
		SpecialString => color('red on_bright_yellow'),
		String => color('green on_bright_yellow'),
		Variable => color('bright_magenta'),
		VerbatimString  => color('bright_black on_bright_yellow'),
		Warning => color('green bold on_red'),
	},

	blue => {
		Alert => color('white bold on_green'),
		Annotation => color('red on_bright_white'),
		Attribute => color('bright_yellow bold'),
		BaseN => color('bright_green'),
		BuiltIn => color('yellow bold'),
		Char => color('cyan on_bright_yellow'),
		Comment => color('white bold on_bright_black'),
		CommentVar => color('green bold'),
		Constant => color('magenta bold'),
		ControlFlow => color('blue bold on_yellow'),
		DataType => color('bright_yellow'),
		DecVal => color('red bold'),
		Documentation => color('black on_bright_white'),
		Error => color('yellow bold on_red'),
		Extension => color('magenta on_blue'),
		Float => color('bright_red bold'),
		Function => color('bright_cyan'),
		Import => color('red on_white'),
		Information => color('blue on_bright_white'),
		Keyword => color('white bold'),
		Normal => ('white on_blue'),
		Operator => color('green'),
		Others => color('cyan bold'),
		Preprocessor => color('bright_blue on_yellow'),
		RegionMarker => color('black on_yellow'),
		SpecialChar => color('blue on_bright_yellow'),
		SpecialString => color('red on_bright_yellow'),
		String => color('green on_bright_yellow'),
		Variable => color('bright_magenta'),
		VerbatimString  => color('bright_black on_bright_yellow'),
		Warning => color('green bold on_red'),
	},

	bright_blue => {
		Alert => color('white bold on_green'),
		Annotation => color('red on_bright_white'),
		Attribute => color('bright_yellow bold'),
		BaseN => color('bright_green'),
		BuiltIn => color('yellow bold'),
		Char => color('cyan on_bright_yellow'),
		Comment => color('white bold on_bright_black'),
		CommentVar => color('green bold'),
		Constant => color('magenta bold'),
		ControlFlow => color('blue bold on_yellow'),
		DataType => color('bright_yellow'),
		DecVal => color('red bold'),
		Documentation => color('black on_bright_white'),
		Error => color('yellow bold on_red'),
		Extension => color('magenta on_blue'),
		Float => color('bright_red bold'),
		Function => color('bright_cyan'),
		Import => color('red on_white'),
		Information => color('blue on_bright_white'),
		Keyword => color('white bold'),
		Normal => color('bright_white on_bright_blue'),
		Operator => color('white'),
		Others => color('cyan bold'),
		Preprocessor => color('bright_blue on_yellow'),
		RegionMarker => color('black on_yellow'),
		SpecialChar => color('blue on_bright_yellow'),
		SpecialString => color('red on_bright_yellow'),
		String => color('green on_bright_yellow'),
		Variable => color('bright_magenta'),
		VerbatimString  => color('bright_black on_bright_yellow'),
		Warning => color('green bold on_red'),
	},

	cyan => {
		Alert => color('white bold on_green'),
		Annotation => color('red on_bright_white'),
		Attribute => color('bright_yellow bold'),
		BaseN => color('bright_green'),
		BuiltIn => color('yellow bold'),
		Char => color('cyan on_bright_yellow'),
		Comment => color('white bold on_bright_black'),
		CommentVar => color('green bold'),
		Constant => color('magenta bold'),
		ControlFlow => color('blue bold on_yellow'),
		DataType => color('bright_yellow'),
		DecVal => color('red bold'),
		Documentation => color('black on_bright_white'),
		Error => color('yellow bold on_red'),
		Extension => color('magenta on_blue'),
		Float => color('bright_red bold'),
		Function => color('bright_cyan'),
		Import => color('red on_white'),
		Information => color('blue on_bright_white'),
		Keyword => color('white bold'),
		Normal => color('bright_white on_cyan'),
		Operator => color('blue'),
		Others => color('blue bold'),
		Preprocessor => color('bright_blue on_yellow'),
		RegionMarker => color('black on_yellow'),
		SpecialChar => color('blue on_bright_yellow'),
		SpecialString => color('red on_bright_yellow'),
		String => color('green on_bright_yellow'),
		Variable => color('bright_blue'),
		VerbatimString  => color('bright_black on_bright_yellow'),
		Warning => color('green bold on_red'),
	},

	bright_cyan => {
		Alert => color('white bold on_green'),
		Annotation => color('red on_bright_white'),
		Attribute => color('bright_yellow bold'),
		BaseN => color('green'),
		BuiltIn => color('yellow bold'),
		Char => color('cyan on_bright_yellow'),
		Comment => color('white bold on_bright_black'),
		CommentVar => color('red'),
		Constant => color('magenta bold'),
		ControlFlow => color('blue bold on_yellow'),
		DataType => color('bright_yellow'),
		DecVal => color('red bold'),
		Documentation => color('black on_bright_white'),
		Error => color('yellow bold on_red'),
		Extension => color('magenta on_blue'),
		Float => color('bright_red bold'),
		Function => color('magenta'),
		Import => color('red on_white'),
		Information => color('blue on_bright_white'),
		Keyword => color('white bold'),
		Normal => color('black on_bright_cyan'),
		Operator => color('blue'),
		Others => color('blue bold'),
		Preprocessor => color('bright_blue on_yellow'),
		RegionMarker => color('black on_yellow'),
		SpecialChar => color('blue on_bright_yellow'),
		SpecialString => color('red on_bright_yellow'),
		String => color('green on_bright_yellow'),
		Variable => color('bright_blue'),
		VerbatimString  => color('bright_black on_bright_yellow'),
		Warning => color('green bold on_red'),
	},

	green => {
		Alert => color('white bold on_bright_blue'),
		Annotation => color('red on_bright_white'),
		Attribute => color('bright_yellow bold'),
		BaseN => color('bright_green'),
		BuiltIn => color('yellow bold'),
		Char => color('cyan on_bright_yellow'),
		Comment => color('white bold on_bright_black'),
		CommentVar => color('green bold'),
		Constant => color('magenta bold'),
		ControlFlow => color('blue bold on_yellow'),
		DataType => color('bright_yellow'),
		DecVal => color('red bold'),
		Documentation => color('black on_bright_white'),
		Error => color('yellow bold on_red'),
		Extension => color('magenta on_blue'),
		Float => color('bright_red bold'),
		Function => color('bright_cyan'),
		Import => color('red on_white'),
		Information => color('blue on_bright_white'),
		Keyword => color('white bold'),
		Normal => color('bright_white on_green'),
		Operator => color('red'),
		Others => color('cyan bold'),
		Preprocessor => color('bright_blue on_yellow'),
		RegionMarker => color('black on_yellow'),
		SpecialChar => color('blue on_bright_yellow'),
		SpecialString => color('red on_bright_yellow'),
		String => color('green on_bright_yellow'),
		Variable => color('bright_white'),
		VerbatimString  => color('bright_black on_bright_yellow'),
		Warning => color('green bold on_red'),
	},

	bright_green => {
		Alert => color('white bold on_bright_blue'),
		Annotation => color('red on_bright_white'),
		Attribute => color('bright_yellow bold'),
		BaseN => color('green'),
		BuiltIn => color('yellow bold'),
		Char => color('cyan on_bright_yellow'),
		Comment => color('white bold on_bright_black'),
		CommentVar => color('blue bold'),
		Constant => color('magenta bold'),
		ControlFlow => color('blue bold on_yellow'),
		DataType => color('bright_yellow'),
		DecVal => color('red bold'),
		Documentation => color('black on_bright_white'),
		Error => color('yellow bold on_red'),
		Extension => color('magenta on_blue'),
		Float => color('bright_red bold'),
		Function => color('bright_blue'),
		Import => color('red on_white'),
		Information => color('blue on_bright_white'),
		Keyword => color('white bold'),
		Normal => color('black on_bright_green'),
		Operator => color('red'),
		Others => color('blue'),
		Preprocessor => color('bright_blue on_yellow'),
		RegionMarker => color('black on_yellow'),
		SpecialChar => color('blue on_bright_yellow'),
		SpecialString => color('red on_bright_yellow'),
		String => color('green on_bright_yellow'),
		Variable => color('bright_white'),
		VerbatimString  => color('bright_black on_bright_yellow'),
		Warning => color('green bold on_red'),
	},

	magenta => {
		Alert => color('white bold on_green'),
		Annotation => color('red on_bright_white'),
		Attribute => color('bright_yellow bold'),
		BaseN => color('bright_green'),
		BuiltIn => color('yellow bold'),
		Char => color('cyan on_bright_yellow'),
		Comment => color('white bold on_bright_black'),
		CommentVar => color('green bold'),
		Constant => color('magenta bold'),
		ControlFlow => color('blue bold on_yellow'),
		DataType => color('bright_yellow'),
		DecVal => color('red bold'),
		Documentation => color('black on_bright_white'),
		Error => color('yellow bold on_red'),
		Extension => color('magenta on_blue'),
		Float => color('bright_red bold'),
		Function => color('bright_cyan'),
		Import => color('red on_white'),
		Information => color('blue on_bright_white'),
		Keyword => color('white bold'),
		Normal => color('bright_white on_magenta'),
		Operator => color('blue'),
		Others => color('cyan bold'),
		Preprocessor => color('bright_blue on_yellow'),
		RegionMarker => color('black on_yellow'),
		SpecialChar => color('blue on_bright_yellow'),
		SpecialString => color('red on_bright_yellow'),
		String => color('green on_bright_yellow'),
		Variable => color('bright_magenta'),
		VerbatimString  => color('bright_black on_bright_yellow'),
		Warning => color('green bold on_red'),
	},

	bright_magenta => {
		Alert => color('white bold on_green'),
		Annotation => color('red on_bright_white'),
		Attribute => color('bright_yellow bold'),
		BaseN => color('bright_green bold'),
		BuiltIn => color('yellow bold'),
		Char => color('cyan on_bright_yellow'),
		Comment => color('white bold on_bright_black'),
		CommentVar => color('green bold'),
		Constant => color('bright_black'),
		ControlFlow => color('blue bold on_yellow'),
		DataType => color('bright_yellow'),
		DecVal => color('blue bold'),
		Documentation => color('black on_bright_white'),
		Error => color('yellow bold on_red'),
		Extension => color('magenta on_blue'),
		Float => color('bright_blue bold'),
		Function => color('bright_cyan'),
		Import => color('red on_white'),
		Information => color('blue on_bright_white'),
		Keyword => color('white bold'),
		Normal => color('black on_bright_magenta'),
		Operator => color('blue'),
		Others => color('cyan bold'),
		Preprocessor => color('bright_blue on_yellow'),
		RegionMarker => color('black on_yellow'),
		SpecialChar => color('blue on_bright_yellow'),
		SpecialString => color('red on_bright_yellow'),
		String => color('green on_bright_yellow'),
		Variable => color('bright_white'),
		VerbatimString  => color('bright_black on_bright_yellow'),
		Warning => color('green bold on_red'),
	},

	red => {
		Alert => color('white bold on_green'),
		Annotation => color('red on_bright_white'),
		Attribute => color('bright_yellow bold'),
		BaseN => color('bright_green'),
		BuiltIn => color('yellow bold'),
		Char => color('cyan on_bright_yellow'),
		Comment => color('white bold on_bright_black'),
		CommentVar => color('green bold'),
		Constant => color('magenta bold'),
		ControlFlow => color('blue bold on_yellow'),
		DataType => color('bright_yellow'),
		DecVal => color('red bold'),
		Documentation => color('black on_bright_white'),
		Error => color('yellow bold on_red'),
		Extension => color('magenta on_blue'),
		Float => color('bright_red bold'),
		Function => color('bright_cyan'),
		Import => color('red on_white'),
		Information => color('blue on_bright_white'),
		Keyword => color('white bold'),
		Normal => color('bright_white on_red'),
		Operator => color('blue'),
		Others => color('cyan bold'),
		Preprocessor => color('bright_blue on_yellow'),
		RegionMarker => color('black on_yellow'),
		SpecialChar => color('blue on_bright_yellow'),
		SpecialString => color('red on_bright_yellow'),
		String => color('green on_bright_yellow'),
		Variable => color('bright_magenta'),
		VerbatimString  => color('bright_black on_bright_yellow'),
		Warning => color('green bold on_red'),
	},

	bright_red => {
		Alert => color('white bold on_green'),
		Annotation => color('red on_bright_white'),
		Attribute => color('bright_yellow bold'),
		BaseN => color('bright_green bold'),
		BuiltIn => color('yellow bold'),
		Char => color('cyan on_bright_yellow'),
		Comment => color('white bold on_bright_black'),
		CommentVar => color('green bold'),
		Constant => color('bright_green bold'),
		ControlFlow => color('blue bold on_yellow'),
		DataType => color('bright_yellow'),
		DecVal => color('blue bold'),
		Documentation => color('black on_bright_white'),
		Error => color('yellow bold on_red'),
		Extension => color('magenta on_blue'),
		Float => color('bright_blue'),
		Function => color('bright_cyan'),
		Import => color('red on_white'),
		Information => color('blue on_bright_white'),
		Keyword => color('white bold'),
		Normal => color('black on_bright_red'),
		Operator => color('blue'),
		Others => color('cyan bold'),
		Preprocessor => color('bright_blue on_yellow'),
		RegionMarker => color('black on_yellow'),
		SpecialChar => color('blue on_bright_yellow'),
		SpecialString => color('red on_bright_yellow'),
		String => color('green on_bright_yellow'),
		Variable => color('magenta'),
		VerbatimString  => color('bright_black on_bright_yellow'),
		Warning => color('green bold on_red'),
	},

	white => {
		Alert => color('white bold on_green'),
		Annotation => color('red on_bright_white'),
		Attribute => color('bright_yellow bold'),
		BaseN => color('bright_white'),
		BuiltIn => color('yellow bold'),
		Char => color('cyan on_bright_yellow'),
		Comment => color('white bold on_bright_black'),
		CommentVar => color('green bold'),
		Constant => color('magenta bold'),
		ControlFlow => color('blue bold on_yellow'),
		DataType => color('bright_yellow'),
		DecVal => color('red bold'),
		Documentation => color('black on_bright_white'),
		Error => color('yellow bold on_red'),
		Extension => color('magenta on_blue'),
		Float => color('bright_red bold'),
		Function => color('bright_cyan'),
		Import => color('red on_white'),
		Information => color('blue on_bright_white'),
		Keyword => color('white bold'),
		Normal => color('black on_white'),
		Operator => color('green'),
		Others => color('cyan bold'),
		Preprocessor => color('bright_blue on_yellow'),
		RegionMarker => color('black on_yellow'),
		SpecialChar => color('blue on_bright_yellow'),
		SpecialString => color('red on_bright_yellow'),
		String => color('green on_bright_yellow'),
		Variable => color('bright_magenta'),
		VerbatimString  => color('bright_black on_bright_yellow'),
		Warning => color('green bold on_red'),
	},

	bright_white => {
		Alert => color('white bold on_green'),
		Annotation => color('red on_white'),
		Attribute => color('bright_green bold'),
		BaseN => color('green'),
		BuiltIn => color('blue bold'),
		Char => color('cyan on_bright_yellow'),
		Comment => color('white bold on_bright_black'),
		CommentVar => color('green bold'),
		Constant => color('magenta bold'),
		ControlFlow => color('blue bold on_yellow'),
		DataType => color('bright_blue'),
		DecVal => color('red bold'),
		Documentation => color('black on_white'),
		Error => color('yellow bold on_red'),
		Extension => color('magenta on_blue'),
		Float => color('bright_red bold'),
		Function => color('bright_cyan'),
		Import => color('red on_white'),
		Information => color('blue on_white'),
		Keyword => color('bright_green bold'),
		Normal => color('black on_bright_white'),
		Operator => color('green'),
		Others => color('cyan bold'),
		Preprocessor => color('bright_blue on_yellow'),
		RegionMarker => color('black on_yellow'),
		SpecialChar => color('blue on_bright_yellow'),
		SpecialString => color('red on_bright_yellow'),
		String => color('green on_bright_yellow'),
		Variable => color('bright_magenta'),
		VerbatimString  => color('bright_black on_bright_yellow'),
		Warning => color('green bold on_red'),
	},

	yellow => {
		Alert => color('white bold on_green'),
		Annotation => color('red on_bright_white'),
		Attribute => color('bright_yellow bold'),
		BaseN => color('bright_green'),
		BuiltIn => color('yellow bold'),
		Char => color('cyan on_bright_yellow'),
		Comment => color('white bold on_bright_black'),
		CommentVar => color('green bold'),
		Constant => color('magenta bold'),
		ControlFlow => color('blue bold on_yellow'),
		DataType => color('bright_yellow'),
		DecVal => color('red bold'),
		Documentation => color('black on_bright_white'),
		Error => color('yellow bold on_red'),
		Extension => color('magenta on_blue'),
		Float => color('bright_red bold'),
		Function => color('bright_cyan'),
		Import => color('red on_white'),
		Information => color('blue on_bright_white'),
		Keyword => color('white bold'),
		Normal => color('black on_yellow'),
		Operator => color('blue'),
		Others => color('cyan bold'),
		Preprocessor => color('bright_blue on_green'),
		RegionMarker => color('black on_green'),
		SpecialChar => color('blue on_bright_yellow'),
		SpecialString => color('red on_bright_yellow'),
		String => color('green on_bright_yellow'),
		Variable => color('bright_magenta'),
		VerbatimString  => color('bright_black on_bright_yellow'),
		Warning => color('green bold on_red'),
	},

	bright_yellow => {
		Alert => color('white bold on_green'),
		Annotation => color('red on_bright_white'),
		Attribute => color('bright_magenta bold'),
		BaseN => color('bright_green'),
		BuiltIn => color('blue bold'),
		Char => color('cyan on_bright_green'),
		Comment => color('white bold on_bright_black'),
		CommentVar => color('green bold'),
		Constant => color('magenta bold'),
		ControlFlow => color('blue bold on_yellow'),
		DataType => color('bright_blue'),
		DecVal => color('red bold'),
		Documentation => color('black on_bright_white'),
		Error => color('yellow bold on_red'),
		Extension => color('magenta on_blue'),
		Float => color('bright_red bold'),
		Function => color('bright_cyan'),
		Import => color('red on_white'),
		Information => color('blue on_bright_white'),
		Keyword => color('bright_black bold'),
		Normal => color('black on_bright_yellow'),
		Operator => color('blue'),
		Others => color('cyan bold'),
		Preprocessor => color('bright_blue on_green'),
		RegionMarker => color('black on_green'),
		SpecialChar => color('blue on_bright_green'),
		SpecialString => color('red on_bright_green'),
		String => color('green on_bright_green'),
		Variable => color('bright_magenta'),
		VerbatimString  => color('bright_black on_bright_green'),
		Warning => color('green bold on_red'),
	},

);

sub new {
   my $class = shift;
   my $engine = shift;
	my %args = (@_);

	my $tagend = color('reset');
	my $stdcolors = delete $args{stdcolors};
	if (defined $stdcolors) {
		$tagend = $tagend . $stdcolors
	}
	$args{tagend} = $tagend;

	my $theme = delete $args{theme};
	unless (defined $theme) { $theme = 'black' }

	unless (exists $args{format_table}) {
		if (exists $themes{$theme} ) {
			$args{format_table} = $themes{$theme};
		} else {
			die "Invalid theme: $theme"
		}
	}

	my $self = $class->SUPER::new($engine, %args);

	return $self;
}

1;
__END__
