
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

#Repeat the selection    
    output$title <- renderUI({ 
        paste("You have selected a", input$body, "hat with a" , input$brim, "brim and a", input$top, "top.")

    })
    
#Requirements title
    output$reqTitle <- renderUI({ 
        paste("Requirements")
        
    })
    
#List the requirements    
    output$reqs <- renderUI({ 
        
        x<-if (input$units=="inches") {"US 7"}
        else if (input$units =="cm") {"4.5mm"}
        
        y<-if (input$units=="inches") {"60 yards"}
        else if (input$units =="cm") {"55 m"}
        
        z<-if (input$units=="inches") {"12 inch"}
        else if (input$units =="cm") {"30 cm"}
        
        
        paste(x, z, "circular needles,", x, "double pointed needles,", y, "of yarn (preferably washable).")
    })
    
#Gauge title
    output$gaugeTitle <- renderUI({ 
        paste("Gauge")
        
    })   
    
#Gauge    
    output$gauge <- renderUI({ 
        
        x<-if (input$units=="inches") {"5 sts = 1 inch in stockinette"}
        else if (input$units =="cm") {"10 sts = 5 cm in stockinette"}
        
        paste(x)
    })

#Brim title
    output$brimTitle <- renderUI({ 
        paste("Brim")
        
    })    
    
    
#Cast on    
    output$start <- renderUI({ 
        paste("Using a circular needle, cast on 64 stitches and join for working in the round. Place a marker at 
        the join, being careful not to twist.")
    })
    
#Do the brim
    output$brim<-renderUI({
        
        x<-if (input$units=="inches") {"1 inch."}
            else if (input$units =="cm") {"2.5 cm."}
        
        
        if (input$brim=="rolled") {
            paste("Work in stockinette stitch for", x, "In the round, this means knitting every round.")
            
            
        } else if (input$brim=="small ribbed"){
            paste("On the next round *K1, P1*, repeat until end. Repeat this round this for", x)
            
        }else if (input$brim=="medium ribbed"){
            paste("On the next round *K2, P2*, repeat until end. Repeat this round this for", x)
        }
        
        else if (input$brim=="large ribbed"){
            paste("On the next round *K4, P4*, repeat until end. Repeat this round this for", x)
        }
    })

#Body title
    output$bodyTitle <- renderUI({ 
        paste("Body")
        
    })    
    
        
#Do the body    
    output$body<-renderUI({
        
        x<-if (input$units=="inches") {
                if (input$brim=="rolled"){"5 inches."}
                else {"4½ inches."}
                }
            else if (input$units=="cm") {
                if (input$brim=="rolled"){"12.5 cm."}
                else {"11.5 cm."}
            }

        y<- if(input$body=="striped"){
            "Switch to the contrast color and alternate colors every two rows. Do not cut the yarn each time,
                but carry it along the inside, twisting each time you change."
        }
        

        
        if (input$body=="plain") {
            paste("Knit in stockinette stich by knitting every row for", x)
        } else if (input$body=="striped"){
            paste(y, "Knit in stockinette stich by knitting every row for", x)
        }
    })
    
    
#Cap title
    output$capTitle <- renderUI({ 
        paste("Cap")
        
    }) 
    
#Do the cap decreases    
    output$cap<-renderUI({
        
        y<- if(input$body=="striped"){
            "Continue to alternate colors every two rows throughout the decreases."
        }
        
        HTML(paste(y, "Switch to double-pointed needles.",  "*(k8, pm, k8) onto one needle,* repeat from * around.", 

                "Decrease in front of each marker and at the end of each needle in the following manner:", 
                  
                "Round 1: *k6, k2tog* across (56 sts)",
              
              "Round 2: *k5, k2tog* across (48 sts)",
              
              "Round 3: *k4, k2tog* across (40 sts)",
              
              "Round 4: *k3, k2tog* across (32 sts)",
              
              "Round 5: *k2, k2tog* across (24 sts)",
              
              "Round 6: *k1, k2tog* across (16sts)",
              
              "Round 7: *k2tog, rm* across (8 sts)",
              
              "Round 8: *k2tog* across (4sts)",
              
              "Place all 4 remaining sts on the same needle. Do not bind off.", sep="<br/>"))
    })
    
#Top title
    output$topTitle <- renderUI({ 
        paste("Top")
        
    })     
    
#Do the top    
    output$top<-renderUI({
        
        x<-if (input$units=="inches") {"6 inch"}
        else if (input$units =="cm") {"15 cm"}
        
        y<-if (input$units=="inches") {"4 inches"}
        else if (input$units =="cm") {"10 cm"}
        
        if (input$top=="plain") {
            paste("When four stitches remain, break off yarn leaving a", x, "tail. Thread 
                  onto a tapestry needle and pull through remaining stitches. Weave in ends.")
        } else if (input$top=="i-cord"){
            paste("When 4 stitches remain, leave them on dpn and work in I-cord for", y, 
                  ". Bind off. Tie resulting I-cord in a knot.")
        }else if (input$top=="pom pom"){
            paste("When four stitches remain, break off yarn leaving a", x, "tail. Make a pom-pom 
                  and attach using the end of the yarn.")
        }
        else if (input$top=="tassle"){
            paste("When four stitches remain, break off yarn leaving a", x, "tail. Make a tassle and 
                  attach using the end of the yarn.")
        }
    })
    
#Provide instructions for decorated tops    
    output$decoration<-renderUI({
        
        x<-if (input$units=="inches") {"½ inch"}
        else if (input$units =="cm") {"1.5 cm"}
        
        
        if (input$top=="pom pom") {
            paste("To make a pom pom: Many knitting and craft stores carry pompom makers, which will make your life a lot
                    easier. I recommend that you buy one and follow the instructions from there. If you find yourself
                    without a pompom maker, all you need is some cardboard, scissors, and a needle.
                    Take a piece of cardboard and cut two identical circles a little larger than you want the
                    pompom to be. Cut a hole in the center of each circle and hold them together. You should have two
                    matching donuts of cardboard. Taking a needle and a long length of yarn, thread the yarn 
                    through the center of the circles and wrap it evenly around the edges. Continue this process 
                    until there is no space left in the center. Using a sharp pair of scissors, cut along the edge
                    where the two circles meet. You should see it start to resemble a pompom. When all the 
                    strings are cut, take a long string, and tie it very tightly and securely between
                    the two circles. Remove the cardboard. Fluff up the edges of the pompom and trim any long 
                    hairs if necessary. If you find the pompom is too large, simply trim it down to the 
                    appropriate size.")
        } else if (input$top=="tassle"){
            paste("To make a tassle: Cut a rectangular piece of cardboard to the length of your finished tassel. 
                Wrap your yarn around the appropriate length many times, until the width on one side is 
                half of the total width you want. Take a piece of yarn and tie a tight and secure knot around 
                one end of the tassel. Cut the yarn at the opposite end. About", x, "from the tied end, wrap 
                another piece of yarn around the entire body of the tassel to form its head. Trim loose 
                ends to an even length.")
        }else if (input$top=="i-cord"){
            "To make i-cord: Knit the required number of stitches. Do not turn. Instead, 
                slide your stitches to the other end of the needle. Pull the string across the back of the first
                stitches, and continue knitting. You should see a knitted tube begin to develop.
                Continue in this process until you’ve reached your desired length, never turning your work.
                Bind off in pattern."
        }
    })
#Documentation   

output$docIntroTitle <- renderUI({ 
    paste("Introduction")
    
})

output$docIntroText <- renderUI({ 
    HTML(paste("This app assumes that you would like to knit a baby hit, and that you have the 
               necessary skills to do so. If you don't, you can still generate the pattern and 
               have someone else knit it for you.", "","If you'd like to learn to knit, or learn 
               one of the techniques used here, please use of the many free online resources.", 
               sep="<br/>"))
   
})
output$docInputTitle <- renderUI({ 
    paste("Inputs")
    
})

output$docInputText <- renderUI({ 
    paste("The current version of the app takes 4 inputs from the radio buttons on the left panel. 
          The first displays the pattern in either inches or cm. The other three allow you to select 
          options for the brim, body, and top of the hat.")
    
})

output$docUnitsTitle <- renderUI({ 
    paste("Units")
    
})

output$docUnitsText <- renderUI({ 
    paste("The units radio button selects whether you would like the pattern to display in inches or cm.")
    
})

output$docBrimTitle <- renderUI({ 
    paste("Brim")
    
})
output$docBrimText <- renderUI({ 
    HTML(paste("The brim is the is very bottom of the hat which frames the face. There are currently 
               4 options: rolled, and three widths of ribbing. ","", 
               "The rolled brim is formed by knitting every row, and it rolls up on itself.", "",
               "Any kind of ribbing will help the hat grip more closely to the head, as it has a lot 
               of stretch in it. Many people say the medium option (k2 p2) has the best grip, but 
               the choice is mainly aesthetic. ", "", "Future versions may include more options for 
               the brim, such as garter stitch or moss stitch.",sep="<br/>"))
    
})
output$docBodyTitle <- renderUI({ 
    paste("Body")
    
})

output$docBodyText <- renderUI({ 
    HTML(paste("Currently, there are two options for the body, plain and striped.","", 
               "Plain is simply stockinette stitch (knit every row in the round). Striped 
               has you change colors every two rows, and reminds you not to cut the yarn each time, 
               but to twist on the inside.","","Both will adjust for a slighly longer body if the 
               rolled brim is selected.","","More options for the body are planned for the future, 
               including eyelet rows, lace, and fair isle patterns.", sep="<br/>"))
    
})

output$docTopTitle <- renderUI({ 
    paste("Top")
    
})

output$docTopText <- renderUI({ 
    HTML(paste("There are currently four options for the top of the hat, plain, i-cord, pom pom 
               and tassle. ","", "Plain is what it sounds like. The other options provide instructions 
               for how to make each embellishment.","","Future versions may include other embellishments 
               such as ear flaps.", sep="<br/>"))
    
})   

output$docAbbrevTitle <- renderUI({ 
    paste("Pattern Abbreviations")
    
})

output$docAbbrevText <- renderUI({ 
    HTML(paste("k - knit","", "p - purl","","k2tog - knit two together","","dpn - double pointed needles", 
               sep="<br/>"))
    
}) 
# output$docLearnTitle <- renderUI({ 
#     paste("Learn to Knit")
#     
# })
# 
# output$docLearnText <- renderUI({ 
#     HTML(paste("Text 1","", "TExt 2", sep="<br/>"))
#     
# }) 


}
)