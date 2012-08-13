-- lists of synonyms
-- jpirie: should these be in their own plugin file so everything can use synonym lists?
local helloSynonyms = {"hi", "hello", "ahoy", "avast", "hallo", "bonjour", "pew", "pow", "hey", "evening", "morning", "afternoon", "prevening", "greetings", "howdy", "hiya"}

local byeSynonyms = {"bye", "night", "n8", "ciao", "later", "in a bit"}

-- simple function that looks for 'hi kiwi'
-- we should really be looking for regexps or something, not
-- straight strings.
function animalParse(currentLine)
  -- make the current line lower case
  currentLine = currentLine:lower()

  if (string.find(currentLine, "kiwi")) then
    if (string.find(currentLine, "cup of tea")) then
      sendLuaMessage("but of course! CREE-CREE!")
    elseif (string.find(currentLine, "pets")) then
      sendLuaMessage("Aww. Thanks! Wuv you! <3")
    elseif (string.find(currentLine, "hi kiwi")) then
      sendLuaMessage("hi, CREE!")
    elseif (string.find(currentLine, "silly kiwi")) then
      sendLuaMessage("Oops I am a bit daft sometimes aren't I. CREE!")
    else
      -- check for hello messages
      -- for _,v in pairs(helloSynonyms) do
      -- 	if (string.find(currentLine, v)) then
      -- 	  sendLuaMessage("hi, CREE!")
      --  	end
      -- end

      -- -- check for goodbye message
      -- for _,v in pairs(byeSynonyms) do
      --  	if (string.find(currentLine, v)) then
      --  	  sendLuaMessage("Laters, I'll keep this channel in check for you, have no fear!")
      -- 	end
      -- end
    end
  end
end

function saveData ()
  print ("Saving animal.lua data...")
end

return {name="Animal Parser", description="Parses greetings for the kiwi",
	parseFunction=animalParse, saveDataFunction=saveData}


