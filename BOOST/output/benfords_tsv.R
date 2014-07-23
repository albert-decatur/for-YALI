# use three BOOST financial columns as 
# example run of this script:
# Rscript benfords_tsv.R estimates.csv revised.csv executed.csv visualize_BOOST_benfords.pdf
args <- commandArgs(TRUE)
pdf(args[4])
library("ggplot2")
df <- read.csv(args[1], sep="\t")
benford = log10(df$leading_digit + 1) - log10(df$leading_digit + 0)
ggplot(df,aes(x=df$leading_digit,y=df$percent_frequency))+geom_bar(stat="identity",fill="blue")+geom_line(aes(y=benford*100))+geom_point(aes(y=benford*100,size=df$ratio_to_benfords))+xlab("Leading Digit")+ylab("Percent Frequency")+ggtitle("Kenyan Budget 2002-2013:\n Leading Digits in Estimates Compared to Benford's Law")+scale_x_continuous(breaks=seq(1,9,by=1))
df <- read.csv(args[2], sep="\t")
ggplot(df,aes(x=df$leading_digit,y=df$percent_frequency))+geom_bar(stat="identity",fill="blue")+geom_line(aes(y=benford*100))+geom_point(aes(y=benford*100,size=df$ratio_to_benfords))+xlab("Leading Digit")+ylab("Percent Frequency")+ggtitle("Kenyan Budget 2002-2013:\n Leading Digits in Revised Compared to Benford's Law")+scale_x_continuous(breaks=seq(1,9,by=1))
df <- read.csv(args[3], sep="\t")
ggplot(df,aes(x=df$leading_digit,y=df$percent_frequency))+geom_bar(stat="identity",fill="blue")+geom_line(aes(y=benford*100))+geom_point(aes(y=benford*100,size=df$ratio_to_benfords))+xlab("Leading Digit")+ylab("Percent Frequency")+ggtitle("Kenyan Budget 2002-2013:\n Leading Digits in Executed Compared to Benford's Law")+scale_x_continuous(breaks=seq(1,9,by=1))
dev.off()
q()
