# Backstory
On May 11, 2015, YouTuber [FlyTech Videos](youtube.com/FlyTechVideos) posted a [creepypasta video](https://www.youtube.com/watch?v=MHlvjC6yOtM) of **000.exe**, a Windows computer virus. The video gained a lot of attention that FlyTech decides to release it publicly for users to try out.
## FlyTech's policy
In his [000.exe Making Of video](https://www.youtube.com/watch?v=e_TYnADDsLQ), FlyTech writes:

> **Warning:**
> This is not a joke program, it will modify the Windows registry and delete some files.  
> <ins>DO NOT</ins> SEND IT TO ANYONE AS A JOKE.  
> <ins>DO NOT</ins> LAUNCH IT ON YOUR MAIN SYSTEM.  
> IF YOU WANT TO TRY IT OUT, USE A <ins>VIRTUAL MACHINE</ins>.

Unfortunately, some users didn't see this warning and therefore still said it was a prank. This is the case with [a user who answered a question on Quora about 000.exe](https://qr.ae/pGLpAt). This user also said the virus is harmless, when it's not. *(Please **do not** accuse this user for saying misleading information!)*

> *Answered May 27, 2017*  
> Its That virus that is apparently still downloadble (who would download it and why would anyone want you to have it) and it does really no harm its basically a prank so no viruses are downloaded but it is pretty annoying

So! Have **you** ever been infected with 000.exe? Do you wanna remove that nasty virus from your computer, but don't wanna do all that registry editing, file cleaning, etc.?  
Don't worry, because **GWE's 000.exe Virus Removal Tool** has got you covered!  
It can remove 000.exe without *any* work!... Well, not really.

Tested with Windows 11.

# How to use
Upon running the script, if a prompt appears, select Yes, as administrator permissions **are required** for the program.  
The program will diagnose your computer first to determine if your computer is infected with 000.exe or not.  
After that, you will be brought to the menu, where you can back up stuff that 000.exe can delete.  
If you are infected, you have the option to attempt to remove the virus, where the program uses the backups that were created before the infection.  
After removing the virus, the program will then tell you what to do **on your own** (as the program *can't* do that) and, of course, *prompt you to restart*.

# FAQ
**Q: What is 000.exe?**  
A: 000.exe is a Windows computer virus, originally made by YouTuber FlyTech Videos as a creepypasta. It's so dangerous that even FlyTech himself said to not use the virus as a prank, and to run the virus on a safe environment, like a virtual machine.

**Q: Who is FlyTech Videos?**  
A: He's a YouTuber who covers all sorts of Windows experiments he does, from messing with ZIP files to deleting the recycle bin, and even "corrupting" the entire C drive (he didn't *really* corrupt it). If you like these sorts of things, maybe you should give him a watch and subscribe to him on YouTube!

**Q: Why did the Quora user think the 000.exe virus was a prank?**  
A: I can't know for sure, but this user probably doesn't know about the origins of the virus and who made it. They probably did not research the virus well enough and just searched "000.exe" and saw that it was made by some random dude on the internet. They don't know whoever this is and assumed that it was just a prank. They probably didn't run the virus themselves, either.

**Q: What is the "WindowsApps" folder?**  
A: The WindowsApps folder is a folder found hidden in the Program Files folder and can't be opened normally. It is present in Windows 8 and onward. It holds all the preinstalled UWP (Universal Windows Platform) applications and also contains the applications you installed from the Microsoft Store.

**Q: I got infected and deleted all the UR NEXT files and the OPENME file on my desktop. The program sees the desktop as "deleted", but some of my desktop's files are still there. Why is that?**  
A: That's because those icons come from the *Public* desktop, which files will appear in every single user's desktop. The other files that were deleted by the virus come from *your own* desktop.

**Q: I used the program to back up my desktop/WindowsApps folder/username. But when restoring, the program cannot restore it/them because they were "not backed up"!**  
A: The program stores its backups in the Temp folder located in `<profile directory>\AppData\Local` (`AppData` is a hidden folder), which stores all the *temporary* files. The backup you made was **deleted** probably because some program cleaned out the Temp folder and deleted the backups. I am working on a fix. In the meantime, try backing them up again. While your system is free of the virus, of course.  

**Q: I found a bug in the program! Where can I report it?**  
A: You can report a bug or glitch in the program [here](https://github.com/gamingwithevets/000exefix/issues/new).
