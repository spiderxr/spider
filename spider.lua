URL     = require("./libs/url")
JSON    = require("./libs/dkjson")
serpent = require("libs/serpent")
json = require('libs/json')
Redis = require('libs/redis').connect('127.0.0.1', 6379)
http  = require("socket.http")
https   = require("ssl.https")
local Methods = io.open("./luatele.lua","r")
if Methods then
URL.tdlua_CallBack() end
SshId = io.popen("echo $SSH_CLIENT ︙ awk '{print $1}'"):read('*a')
luatele = require 'luatele'
local FileInformation = io.open("./Information.lua","r")
if not FileInformation then
if not Redis:get(SshId.."Info:Redis:Token") then
io.write('\27[1;31mارسل لي توكن البوت الان \nSend Me a Bot Token Now ↡\n\27[0;39;49m')
local TokenBot = io.read()
if TokenBot and TokenBot:match('(%d+):(.*)') then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe')
local Json_Info = JSON.decode(url)
if res ~= 200 then
print('\27[1;34mعذرا توكن البوت خطأ تحقق منه وارسله مره اخره \nBot Token is Wrong\n')
else
io.write('\27[1;34mتم حفظ التوكن بنجاح \nThe token been saved successfully \n\27[0;39;49m')
TheTokenBot = TokenBot:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..TheTokenBot)
Redis:set(SshId.."Info:Redis:Token",TokenBot)
Redis:set(SshId.."Info:Redis:Token:User",Json_Info.result.username) end 
else
print('\27[1;34mلم يتم حفظ التوكن جرب مره اخره \nToken not saved, try again') end 
os.execute('lua spider.lua') end
if not Redis:get(SshId.."Info:Redis:User") then
io.write('\27[1;31mارسل معرف المطور الاساسي الان \nDeveloper UserName saved ↡\n\27[0;39;49m')
local UserSudo = io.read():gsub('@','')
if UserSudo ~= '' then
io.write('\n\27[1;34mتم حفظ معرف المطور \nDeveloper UserName saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User",UserSudo)
else
print('\n\27[1;34mلم يتم حفظ معرف المطور الاساسي \nDeveloper UserName not saved\n') end 
os.execute('lua spider.lua') end
if not Redis:get(SshId.."Info:Redis:User:ID") then
io.write('\27[1;31mارسل ايدي المطور الاساسي الان \nDeveloper ID saved ↡\n\27[0;39;49m')
local UserId = io.read()
if UserId and UserId:match('(%d+)') then
io.write('\n\27[1;34mتم حفظ ايدي المطور \nDeveloper ID saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User:ID",UserId)
else
print('\n\27[1;34mلم يتم حفظ ايدي المطور الاساسي \nDeveloper ID not saved\n') end 
os.execute('lua spider.lua') end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Redis:get(SshId.."Info:Redis:Token")..[[",
UserBot = "]]..Redis:get(SshId.."Info:Redis:Token:User")..[[",
UserSudo = "]]..Redis:get(SshId.."Info:Redis:User")..[[",
SudoId = ]]..Redis:get(SshId.."Info:Redis:User:ID")..[[
}
]])
Informationlua:close()
local itsspider = io.open("itsspider", 'w')
itsspider:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
sudo lua5.3 spider.lua
done
]])
itsspider:close()
local Run = io.open("Run", 'w')
Run:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
screen -S ]]..Redis:get(SshId.."Info:Redis:Token:User")..[[ -X kill
screen -S ]]..Redis:get(SshId.."Info:Redis:Token:User")..[[ ./itsspider
done
]])
Run:close()
Redis:del(SshId.."Info:Redis:User:ID");Redis:del(SshId.."Info:Redis:User");Redis:del(SshId.."Info:Redis:Token:User");Redis:del(SshId.."Info:Redis:Token")
os.execute('chmod +x itsspider;chmod +x Run;./Run') end
Information = dofile('./Information.lua')
Sudo_Id = Information.SudoId
UserSudo = Information.UserSudo
Token = Information.Token
UserBot = Information.UserBot
itsspider = Token:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..itsspider)
LuaTele = luatele.set_config{api_id=2692371,api_hash='fe85fff033dfe0f328aeb02b4f784930',session_name=itsspider,token=Token}
function var(value)  
print(serpent.block(value, {comment=false}))   
end 
function chat_type(ChatId)
if ChatId then
local id = tostring(ChatId)
if id:match("-100(%d+)") then
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot'  end end
return Chat_Type
end
function The_ControllerAll(UserId)
ControllerAll = false
local ListSudos ={Sudo_Id,833156404}  
for k, v in pairs(ListSudos) do
if tonumber(UserId) == tonumber(v) then
ControllerAll = true end end
return ControllerAll
end
function Controllerbanall(ChatId,UserId)
Status = 0
DevelopersAS = Redis:sismember(itsspider.."spider:DevelopersAS:Groups",UserId) 
DevelopersQ = Redis:sismember(itsspider.."spider:DevelopersQ:Groups",UserId) 
if UserId == 833156404 then Status = true elseif UserId == 833156404 then Status = true elseif UserId == Sudo_Id then Status = true elseif UserId == itsspider then Status = true elseif DevelopersAS then Status = true elseif DevelopersQ then Status = true else Status = false end return Status end
function Controller(ChatId,UserId) Status = 0
Developers = Redis:sismember(itsspider.."spider:Developers:Groups",UserId) 
DevelopersAS = Redis:sismember(itsspider.."spider:DevelopersAS:Groups",UserId) 
DevelopersQ = Redis:sismember(itsspider.."spider:DevelopersQ:Groups",UserId) 
TheBasics = Redis:sismember(itsspider.."spider:TheBasics:Group"..ChatId,UserId)
TheBasicsQ = Redis:sismember(itsspider.."spider:TheBasicsQ:Group"..ChatId,UserId) 
TheBas = Redis:sismember(itsspider.."spider:TheBas:Group"..ChatId,UserId) 
Originators = Redis:sismember(itsspider.."spider:Originators:Group"..ChatId,UserId)
Managers = Redis:sismember(itsspider.."spider:Managers:Group"..ChatId,UserId)
Addictive = Redis:sismember(itsspider.."spider:Addictive:Group"..ChatId,UserId)
Distinguished = Redis:sismember(itsspider.."spider:Distinguished:Group"..ChatId,UserId)
Cleaner = Redis:sismember(itsspider.."spider:Cleaner:Group"..ChatId,UserId)
StatusMember = LuaTele.getChatMember(ChatId,UserId).status.luatele
if UserId == 833156404 then Status = 'مبرمج السورس' elseif UserId == 833156404 then Status = 'مبرمج السورس' elseif UserId == Sudo_Id then Status = 'المطور الاساسي' elseif UserId == itsspider then Status = 'البوت' elseif DevelopersAS then Status = 'المطور الاساسي' elseif DevelopersQ then Status = 'المطور الاساسي²' elseif Developers then Status = Redis:get(itsspider.."spider:Developer:Bot:Reply"..ChatId) or 'المطور' elseif TheBas then Status = Redis:get(itsspider.."spider:TheBas:Group:Reply"..ChatId) or 'المالك' elseif TheBasicsQ then Status = Redis:get(itsspider.."spider:PresidentQ:Group:Reply"..ChatId) or 'المالك' elseif TheBasics then Status = Redis:get(itsspider.."spider:President:Group:Reply"..ChatId) or 'المنشئ الاساسي' elseif Originators then Status = Redis:get(itsspider.."spider:Constructor:Group:Reply"..ChatId) or 'المنشئ' elseif Managers then Status = Redis:get(itsspider.."spider:Manager:Group:Reply"..ChatId) or 'المدير' elseif Addictive then Status = Redis:get(itsspider.."spider:Admin:Group:Reply"..ChatId) or 'الادمن' elseif StatusMember == "chatMemberStatusCreator" then Status = 'مالك المجموعة' elseif StatusMember == "chatMemberStatusAdministrator" then Status = 'ادمن المجموعة' elseif Distinguished then Status = Redis:get(itsspider.."spider:Vip:Group:Reply"..ChatId) or 'المميز' elseif Cleaner then Status = Redis:get(itsspider.."spider:Cle:Group:Reply"..ChatId) or 'المنظف' else Status = Redis:get(itsspider.."spider:Mempar:Group:Reply"..ChatId) or 'العضو' end return Status end 
function Controller_Num(Num) Status = 0 if tonumber(Num) == 1 then Status = 'المطور الاساسي' elseif tonumber(Num) == 100 then Status = 'المطور الاساسي' elseif tonumber(Num) == 2 then Status = 'المطور الاساسي²' elseif tonumber(Num) == 3 then Status = 'المطور' elseif tonumber(Num) == 99 then Status = 'المالك' elseif tonumber(Num) == 44 then Status = 'المالك' elseif tonumber(Num) == 4 then Status = 'المنشئ الاساسي' elseif tonumber(Num) == 5 then Status = 'المنشئ' elseif tonumber(Num) == 6 then Status = 'المدير' elseif tonumber(Num) == 7 then Status = 'الادمن' elseif tonumber(Num) == 88 then Status = 'المنظف' else Status = 'المميز' end return Status end 
function GetAdminsSlahe(ChatId,UserId,user2,MsgId,t1,t2,t3,t4,t5,t6)
local GetMemberStatus = LuaTele.getChatMember(ChatId,user2).status
if GetMemberStatus.can_change_info then change_info = '‹ ✓ ›' else change_info = '‹ ✗ ›' end
if GetMemberStatus.can_delete_messages then delete_messages = '‹ ✓ ›' else delete_messages = '‹ ✗ ›' end
if GetMemberStatus.can_invite_users then invite_users = '‹ ✓ ›' else invite_users = '‹ ✗ ›' end
if GetMemberStatus.can_pin_messages then pin_messages = '‹ ✓ ›' else pin_messages = '‹ ✗ ›' end
if GetMemberStatus.can_restrict_members then restrict_members = '‹ ✓ ›' else restrict_members = '‹ ✗ ›' end
if GetMemberStatus.can_promote_members then promote = '‹ ✓ ›' else promote = '‹ ✗ ›' end
local reply_markupp = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'تغيير معلومات المجموعة : '..(t1 or change_info), data = UserId..'/groupNum1//'..user2},},{{text = 'تثبيت الرسائل : '..(t2 or pin_messages), data = UserId..'/groupNum2//'..user2},},{{text = 'حظر المستخدمين : '..(t3 or restrict_members), data = UserId..'/groupNum3//'..user2},},{{text = 'دعوة المستخدمين : '..(t4 or invite_users), data = UserId..'/groupNum4//'..user2},},{{text = 'حذف الرسائل : '..(t5 or delete_messages), data = UserId..'/groupNum5//'..user2},},{{text = 'اضافة مشرفين : '..(t6 or promote), data = UserId..'/groupNum6//'..user2},},}}
LuaTele.editMessageText(ChatId,MsgId,"⌁ : صلاحيات الادمن حالياًً ↫ ⤈", 'md', false, false, reply_markupp) end
function GetAdminsNum(ChatId,UserId)
local GetMemberStatus = LuaTele.getChatMember(ChatId,UserId).status
if GetMemberStatus.can_change_info then change_info = 1 else change_info = 0 end
if GetMemberStatus.can_delete_messages then delete_messages = 1 else delete_messages = 0 end
if GetMemberStatus.can_invite_users then invite_users = 1 else invite_users = 0 end
if GetMemberStatus.can_pin_messages then pin_messages = 1 else pin_messages = 0 end
if GetMemberStatus.can_restrict_members then restrict_members = 1 else restrict_members = 0 end
if GetMemberStatus.can_promote_members then promote = 1 else promote = 0 end
return{ promote = promote, restrict_members = restrict_members, invite_users = invite_users, pin_messages = pin_messages, delete_messages = delete_messages, change_info = change_info } end
function GetSetieng(ChatId)
if Redis:get(itsspider.."spider:lockpin"..ChatId) then lock_pin = "✓" else lock_pin = "✗" end
if Redis:get(itsspider.."spider:Lock:tagservr"..ChatId) then lock_tagservr = "✓" else lock_tagservr = "✗" end
if Redis:get(itsspider.."spider:Lock:text"..ChatId) then lock_text = "✓" else lock_text = "✗ " end
if Redis:get(itsspider.."spider:Lock:AddMempar"..ChatId) == "kick" then lock_add = "✓" else lock_add = "✗ " end    
if Redis:get(itsspider.."spider:Lock:Join"..ChatId) == "kick" then lock_join = "✓" else lock_join = "✗ " end    
if Redis:get(itsspider.."spider:Lock:edit"..ChatId) then lock_edit = "✓" else lock_edit = "✗ " end
if Redis:get(itsspider.."spider:Chek:Welcome"..ChatId) then welcome = "✓" else welcome = "✗ " end
if Redis:hget(itsspider.."spider:Spam:Group:User"..ChatId, "Spam:User") == "kick" then flood = "بالطرد "     
elseif Redis:hget(itsspider.."spider:Spam:Group:User"..ChatId,"Spam:User") == "keed" then flood = "بالتقيد "     
elseif Redis:hget(itsspider.."spider:Spam:Group:User"..ChatId,"Spam:User") == "mute" then flood = "بالكتم "           
elseif Redis:hget(itsspider.."spider:Spam:Group:User"..ChatId,"Spam:User") == "del" then flood = "✓" else flood = "✗ " end
if Redis:get(itsspider.."spider:Lock:Photo"..ChatId) == "del" then lock_photo = "✓" 
elseif Redis:get(itsspider.."spider:Lock:Photo"..ChatId) == "ked" then lock_photo = "بالتقيد "   
elseif Redis:get(itsspider.."spider:Lock:Photo"..ChatId) == "ktm" then lock_photo = "بالكتم "    
elseif Redis:get(itsspider.."spider:Lock:Photo"..ChatId) == "kick" then lock_photo = "بالطرد " else lock_photo = "✗ " end    
if Redis:get(itsspider.."spider:Lock:Contact"..ChatId) == "del" then lock_phon = "✓" 
elseif Redis:get(itsspider.."spider:Lock:Contact"..ChatId) == "ked" then lock_phon = "بالتقيد "    
elseif Redis:get(itsspider.."spider:Lock:Contact"..ChatId) == "ktm" then lock_phon = "بالكتم "    
elseif Redis:get(itsspider.."spider:Lock:Contact"..ChatId) == "kick" then lock_phon = "بالطرد " else lock_phon = "✗ " end    
if Redis:get(itsspider.."spider:Lock:Link"..ChatId) == "del" then lock_links = "✓"
elseif Redis:get(itsspider.."spider:Lock:Link"..ChatId) == "ked" then lock_links = "بالتقيد "    
elseif Redis:get(itsspider.."spider:Lock:Link"..ChatId) == "ktm" then lock_links = "بالكتم "    
elseif Redis:get(itsspider.."spider:Lock:Link"..ChatId) == "kick" then lock_links = "بالطرد " else lock_links = "✗ " end
if Redis:get(itsspider.."spider:Lock:Cmd"..ChatId) == "del" then lock_cmds = "✓"
elseif Redis:get(itsspider.."spider:Lock:Cmd"..ChatId) == "ked" then lock_cmds = "بالتقيد "    
elseif Redis:get(itsspider.."spider:Lock:Cmd"..ChatId) == "ktm" then lock_cmds = "بالكتم "   
elseif Redis:get(itsspider.."spider:Lock:Cmd"..ChatId) == "kick" then lock_cmds = "بالطرد " else lock_cmds = "✗ " end
if Redis:get(itsspider.."spider:Lock:User:Name"..ChatId) == "del" then lock_user = "✓"
elseif Redis:get(itsspider.."spider:Lock:User:Name"..ChatId) == "ked" then lock_user = "بالتقيد "    
elseif Redis:get(itsspider.."spider:Lock:User:Name"..ChatId) == "ktm" then lock_user = "بالكتم "    
elseif Redis:get(itsspider.."spider:Lock:User:Name"..ChatId) == "kick" then lock_user = "بالطرد " else lock_user = "✗ " end
if Redis:get(itsspider.."spider:Lock:hashtak"..ChatId) == "del" then lock_hash = "✓"
elseif Redis:get(itsspider.."spider:Lock:hashtak"..ChatId) == "ked" then lock_hash = "بالتقيد "    
elseif Redis:get(itsspider.."spider:Lock:hashtak"..ChatId) == "ktm" then lock_hash = "بالكتم "    
elseif Redis:get(itsspider.."spider:Lock:hashtak"..ChatId) == "kick" then lock_hash = "بالطرد " else lock_hash = "✗ " end
if Redis:get(itsspider.."spider:Lock:vico"..ChatId) == "del" then lock_muse = "✓"
elseif Redis:get(itsspider.."spider:Lock:vico"..ChatId) == "ked" then lock_muse = "بالتقيد "    
elseif Redis:get(itsspider.."spider:Lock:vico"..ChatId) == "ktm" then lock_muse = "بالكتم "    
elseif Redis:get(itsspider.."spider:Lock:vico"..ChatId) == "kick" then lock_muse = "بالطرد " else lock_muse = "✗ " end 
if Redis:get(itsspider.."spider:Lock:Video"..ChatId) == "del" then lock_ved = "✓"
elseif Redis:get(itsspider.."spider:Lock:Video"..ChatId) == "ked" then lock_ved = "بالتقيد "    
elseif Redis:get(itsspider.."spider:Lock:Video"..ChatId) == "ktm" then lock_ved = "بالكتم "    
elseif Redis:get(itsspider.."spider:Lock:Video"..ChatId) == "kick" then lock_ved = "بالطرد " else lock_ved = "✗ " end
if Redis:get(itsspider.."spider:Lock:Animation"..ChatId) == "del" then lock_gif = "✓"
elseif Redis:get(itsspider.."spider:Lock:Animation"..ChatId) == "ked" then lock_gif = "بالتقيد "    
elseif Redis:get(itsspider.."spider:Lock:Animation"..ChatId) == "ktm" then lock_gif = "بالكتم "    
elseif Redis:get(itsspider.."spider:Lock:Animation"..ChatId) == "kick" then lock_gif = "بالطرد " else lock_gif = "✗ " end
if Redis:get(itsspider.."spider:Lock:Sticker"..ChatId) == "del" then lock_ste = "✓"
elseif Redis:get(itsspider.."spider:Lock:Sticker"..ChatId) == "ked" then lock_ste = "بالتقيد "    
elseif Redis:get(itsspider.."spider:Lock:Sticker"..ChatId) == "ktm" then lock_ste = "بالكتم "    
elseif Redis:get(itsspider.."spider:Lock:Sticker"..ChatId) == "kick" then lock_ste = "بالطرد " else lock_ste = "✗ " end
if Redis:get(itsspider.."spider:Lock:geam"..ChatId) == "del" then lock_geam = "✓"
elseif Redis:get(itsspider.."spider:Lock:geam"..ChatId) == "ked" then lock_geam = "بالتقيد "    
elseif Redis:get(itsspider.."spider:Lock:geam"..ChatId) == "ktm" then lock_geam = "بالكتم "    
elseif Redis:get(itsspider.."spider:Lock:geam"..ChatId) == "kick" then lock_geam = "بالطرد " else lock_geam = "✗ " end    
if Redis:get(itsspider.."spider:Lock:vico"..ChatId) == "del" then lock_vico = "✓"
elseif Redis:get(itsspider.."spider:Lock:vico"..ChatId) == "ked" then lock_vico = "بالتقيد "    
elseif Redis:get(itsspider.."spider:Lock:vico"..ChatId) == "ktm" then lock_vico = "بالكتم "    
elseif Redis:get(itsspider.."spider:Lock:vico"..ChatId) == "kick" then lock_vico = "بالطرد " else lock_vico = "✗ " end    
if Redis:get(itsspider.."spider:Lock:Keyboard"..ChatId) == "del" then lock_inlin = "✓"
elseif Redis:get(itsspider.."spider:Lock:Keyboard"..ChatId) == "ked" then lock_inlin = "بالتقيد "
elseif Redis:get(itsspider.."spider:Lock:Keyboard"..ChatId) == "ktm" then lock_inlin = "بالكتم "    
elseif Redis:get(itsspider.."spider:Lock:Keyboard"..ChatId) == "kick" then lock_inlin = "بالطرد " else lock_inlin = "✗ " end
if Redis:get(itsspider.."spider:Lock:forward"..ChatId) == "del" then lock_fwd = "✓"
elseif Redis:get(itsspider.."spider:Lock:forward"..ChatId) == "ked" then lock_fwd = "بالتقيد "    
elseif Redis:get(itsspider.."spider:Lock:forward"..ChatId) == "ktm" then lock_fwd = "بالكتم "    
elseif Redis:get(itsspider.."spider:Lock:forward"..ChatId) == "kick" then lock_fwd = "بالطرد " else lock_fwd = "✗ " end    
if Redis:get(itsspider.."spider:Lock:Document"..ChatId) == "del" then lock_file = "✓"
elseif Redis:get(itsspider.."spider:Lock:Document"..ChatId) == "ked" then lock_file = "بالتقيد "    
elseif Redis:get(itsspider.."spider:Lock:Document"..ChatId) == "ktm" then lock_file = "بالكتم "    
elseif Redis:get(itsspider.."spider:Lock:Document"..ChatId) == "kick" then lock_file = "بالطرد " else lock_file = "✗ " end    
if Redis:get(itsspider.."spider:Lock:Unsupported"..ChatId) == "del" then lock_self = "✓"
elseif Redis:get(itsspider.."spider:Lock:Unsupported"..ChatId) == "ked" then lock_self = "بالتقيد "    
elseif Redis:get(itsspider.."spider:Lock:Unsupported"..ChatId) == "ktm" then lock_self = "بالكتم "    
elseif Redis:get(itsspider.."spider:Lock:Unsupported"..ChatId) == "kick" then lock_self = "بالطرد " else lock_self = "✗ " end
if Redis:get(itsspider.."spider:Lock:Bot:kick"..ChatId) == "del" then lock_bots = "✓"
elseif Redis:get(itsspider.."spider:Lock:Bot:kick"..ChatId) == "ked" then lock_bots = "بالتقيد "   
elseif Redis:get(itsspider.."spider:Lock:Bot:kick"..ChatId) == "kick" then lock_bots = "بالطرد " else lock_bots = "✗ " end
if Redis:get(itsspider.."spider:Lock:Markdaun"..ChatId) == "del" then lock_mark = "✓"
elseif Redis:get(itsspider.."spider:Lock:Markdaun"..ChatId) == "ked" then lock_mark = "بالتقيد "    
elseif Redis:get(itsspider.."spider:Lock:Markdaun"..ChatId) == "ktm" then lock_mark = "بالكتم "    
elseif Redis:get(itsspider.."spider:Lock:Markdaun"..ChatId) == "kick" then lock_mark = "بالطرد " else lock_mark = "✗ " end
if Redis:get(itsspider.."spider:Lock:Spam"..ChatId) == "del" then lock_spam = "✓"
elseif Redis:get(itsspider.."spider:Lock:Spam"..ChatId) == "ked" then lock_spam = "بالتقيد "    
elseif Redis:get(itsspider.."spider:Lock:Spam"..ChatId) == "ktm" then lock_spam = "بالكتم "    
elseif Redis:get(itsspider.."spider:Lock:Spam"..ChatId) == "kick" then lock_spam = "بالطرد " else lock_spam = "✗ " end        
return{ lock_pin = lock_pin, lock_tagservr = lock_tagservr, lock_text = lock_text, lock_add = lock_add, lock_join = lock_join, lock_edit = lock_edit, flood = flood, lock_photo = lock_photo, lock_phon = lock_phon, lock_links = lock_links, lock_cmds = lock_cmds, lock_mark = lock_mark, lock_user = lock_user, lock_hash = lock_hash, lock_muse = lock_muse, lock_ved = lock_ved, lock_gif = lock_gif, lock_ste = lock_ste, lock_geam = lock_geam, lock_vico = lock_vico, lock_inlin = lock_inlin, lock_fwd = lock_fwd, lock_file = lock_file, lock_self = lock_self, lock_bots = lock_bots, lock_spam = lock_spam } end
function Total_message(Message) local MsgText = ''  
if tonumber(Message) < 100 then MsgText = 'جدا ضعيف' elseif tonumber(Message) < 200 then MsgText = 'ضعيف' elseif tonumber(Message) < 400 then MsgText = 'غير متفاعل' elseif tonumber(Message) < 700 then MsgText = 'متوسط' elseif tonumber(Message) < 1200 then MsgText = 'قمة التفاعل' elseif tonumber(Message) < 2000 then MsgText = 'ملك التفاعل' elseif tonumber(Message) < 3500 then MsgText = 'اسطورة التفاعل' elseif tonumber(Message) < 4000 then MsgText = 'عوف لجواهر' elseif tonumber(Message) < 4500 then MsgText = 'متفاعل نار' elseif tonumber(Message) < 5500 then MsgText = 'يجدح جدح' elseif tonumber(Message) < 7000 then MsgText = 'خيالي' elseif tonumber(Message) < 9500 then MsgText = 'كافر بالتفاعل' elseif tonumber(Message) < 10000000000 then MsgText = 'معلك لربك' end return MsgText end
function Getpermissions(ChatId) local Get_Chat = LuaTele.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then web = true else web = false end
if Get_Chat.permissions.can_change_info then info = true else info = false end
if Get_Chat.permissions.can_invite_users then invite = true else invite = false end
if Get_Chat.permissions.can_pin_messages then pin = true else pin = false end
if Get_Chat.permissions.can_send_media_messages then media = true else media = false end
if Get_Chat.permissions.can_send_messages then messges = true else messges = false end
if Get_Chat.permissions.can_send_other_messages then other = true else other = false end
if Get_Chat.permissions.can_send_polls then polls = true else polls = false end
return{ web = web, info = info, invite = invite, pin = pin, media = media, messges = messges, other = other, polls = polls } end
function Get_permissions(ChatId,UserId,MsgId) local Get_Chat = LuaTele.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then web = '‹ ✓ ›' else web = '‹ ✗ ›' end
if Get_Chat.permissions.can_change_info then info = '‹ ✓ ›' else info = '‹ ✗ ›' end
if Get_Chat.permissions.can_invite_users then invite = '‹ ✓ ›' else invite = '‹ ✗ ›' end
if Get_Chat.permissions.can_pin_messages then pin = '‹ ✓ ›' else pin = '‹ ✗ ›' end
if Get_Chat.permissions.can_send_media_messages then media = '‹ ✓ ›' else media = '‹ ✗ ›' end
if Get_Chat.permissions.can_send_messages then messges = '‹ ✓ ›' else messges = '‹ ✗ ›' end
if Get_Chat.permissions.can_send_other_messages then other = '‹ ✓ ›' else other = '‹ ✗ ›' end
if Get_Chat.permissions.can_send_polls then polls = '‹ ✓ ›' else polls = '‹ ✗ ›' end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ' ارسال الويب : '..web, data = UserId..'/web'},},{{text = ' تغيير معلومات المجموعة : '..info, data = UserId.. '/info'},},{{text = ' اضافه مستخدمين : '..invite, data = UserId.. '/invite'},},{{text = ' تثبيت الرسائل : '..pin, data = UserId.. '/pin'},},{{text = ' ارسال الميديا : '..media, data = UserId.. '/media'},},{{text = ' ارسال الرسائل : '..messges, data = UserId.. '/messges'},},{{text = ' اضافه البوتات : '..other, data = UserId.. '/other'},},{{text = ' ارسال استفتاء : '..polls, data = UserId.. '/polls'},},{{text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. '/delAmr'}},}}
LuaTele.editMessageText(ChatId,MsgId,"⌁ : صلاحيات المجموعة ↫ ⤈ ", 'md', false, false, reply_markup) end
function Statusrestricted(ChatId,UserId)
return{ BanAll = Redis:sismember(itsspider.."spider:BanAll:Groups",UserId) , ktmAll = Redis:sismember(itsspider.."spider:ktmAll:Groups",UserId) , BanGroup = Redis:sismember(itsspider.."spider:BanGroup:Group"..ChatId,UserId) , SilentGroup = Redis:sismember(itsspider.."spider:SilentGroup:Group"..ChatId,UserId) } end
function Reply_Status(UserId,TextMsg) local UserInfo = LuaTele.getUser(UserId)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do UserInfo.first_name = Name_User break end
if UserInfo.username then UserInfousername = '['..UserInfo.first_name..'](t.me/'..UserInfo.username..')' else UserInfousername = '['..UserInfo.first_name..'](tg://user?id='..UserId..')' end
return { Lock = '*⌁ : بواسطة ↫ *'..UserInfousername..'\n*'..TextMsg..'*', unLock = '*⌁ : بواسطة ↫ *'..UserInfousername..'\n'..TextMsg, lockKtm = '*⌁ : بواسطة ↫ *'..UserInfousername..'\n*'..TextMsg..' بالكتم *', lockKid = '*⌁ : بواسطة ↫ *'..UserInfousername..'\n*'..TextMsg..' بالتقييد *', lockKick = '*⌁ : بواسطة ↫ *'..UserInfousername..'\n*'..TextMsg..' بالطرد *', Reply = '*⌁ : العضو ↫ *'..UserInfousername..'\n*'..TextMsg..'*', ReplyOR33 = '⌁ : عزيزي ↫ '..UserInfousername..'\n'..TextMsg..'' } end
function StatusCanOrNotCan(ChatId,UserId) Status = nil
DevelopersAS = Redis:sismember(itsspider.."spider:DevelopersAS:Groups",UserId) 
DevelopersQ = Redis:sismember(itsspider.."spider:DevelopersQ:Groups",UserId) 
Developers = Redis:sismember(itsspider.."spider:Developers:Groups",UserId) 
TheBasics = Redis:sismember(itsspider.."spider:TheBasics:Group"..ChatId,UserId) 
Originators = Redis:sismember(itsspider.."spider:Originators:Group"..ChatId,UserId)
Managers = Redis:sismember(itsspider.."spider:Managers:Group"..ChatId,UserId)
Addictive = Redis:sismember(itsspider.."spider:Addictive:Group"..ChatId,UserId)
Distinguished = Redis:sismember(itsspider.."spider:Distinguished:Group"..ChatId,UserId)
Cleaner = Redis:sismember(itsspider.."spider:Cleaner:Group"..ChatId,UserId)
StatusMember = LuaTele.getChatMember(ChatId,UserId).status.luatele
if UserId == 833156404 then Status = true elseif UserId == 833156404 then Status = true elseif UserId == Sudo_Id then Status = true elseif UserId == itsspider then Status = true elseif DevelopersAS then Status = true elseif DevelopersQ then Status = true elseif Developers then Status = true elseif TheBasics then Status = true elseif Originators then Status = true elseif Managers then Status = true elseif Addictive then Status = true elseif StatusMember == "chatMemberStatusCreator" then Status = true elseif StatusMember == "chatMemberStatusAdministrator" then Status = true elseif Distinguished then Status = true elseif Cleaner then Status = true else Status = false end return Status end 
function StatusSilent(ChatId,UserId) Status = nil
DevelopersAS = Redis:sismember(itsspider.."spider:DevelopersAS:Groups",UserId) 
DevelopersQ = Redis:sismember(itsspider.."spider:DevelopersQ:Groups",UserId) 
Developers = Redis:sismember(itsspider.."spider:Developers:Groups",UserId) 
TheBasics = Redis:sismember(itsspider.."spider:TheBasics:Group"..ChatId,UserId) 
Originators = Redis:sismember(itsspider.."spider:Originators:Group"..ChatId,UserId)
Managers = Redis:sismember(itsspider.."spider:Managers:Group"..ChatId,UserId)
Addictive = Redis:sismember(itsspider.."spider:Addictive:Group"..ChatId,UserId)
Distinguished = Redis:sismember(itsspider.."spider:Distinguished:Group"..ChatId,UserId)
Cleaner = Redis:sismember(itsspider.."spider:Cleaner:Group"..ChatId,UserId)
StatusMember = LuaTele.getChatMember(ChatId,UserId).status.luatele
if UserId == 833156404 then Status = true elseif UserId == 833156404 then Status = true elseif UserId == Sudo_Id then Status = true elseif UserId == itsspider then Status = true elseif DevelopersAS then Status = true elseif DevelopersQ then Status = true elseif Developers then Status = true elseif TheBasics then Status = true elseif Originators then Status = true elseif Managers then Status = true elseif Addictive then Status = true elseif StatusMember == "chatMemberStatusCreator" then Status = true else Status = false end return Status end 
function GetInfoBot(msg) local GetMemberStatus = LuaTele.getChatMember(msg.chat_id,itsspider).status
if GetMemberStatus.can_change_info then change_info = true else change_info = false end
if GetMemberStatus.can_delete_messages then delete_messages = true else delete_messages = false end
if GetMemberStatus.can_invite_users then invite_users = true else invite_users = false end
if GetMemberStatus.can_pin_messages then pin_messages = true else pin_messages = false end
if GetMemberStatus.can_restrict_members then restrict_members = true else restrict_members = false end
if GetMemberStatus.can_promote_members then promote = true else promote = false end
return{ SetAdmin = promote, BanUser = restrict_members, Invite = invite_users, PinMsg = pin_messages, DelMsg = delete_messages, Info = change_info } end
function download(url,name)
if not name then name = url:match('([^/]+)$') end
if string.find(url,'https') then data,res = https.request(url)
elseif string.find(url,'http') then data,res = http.request(url) else
return 'The link format is incorrect.' end
if res ~= 200 then return 'check url , error code : '..res else
file = io.open(name,'wb')
file:write(data)
file:close()
print('Downloaded :> '..name)
return './'..name end end
local function Info_Video(x)
local f=io.popen(x)
if f then local s=f:read"*a" f:close()
if s == 'a' then end return s end end
function ChannelJoin(msg) JoinChannel = true
local Channel = Redis:get(itsspider..'spider:Channel:Join')
if Channel then
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..msg.sender.user_id)
local ChannelJoin = JSON.decode(url)
if ChannelJoin.result.status == "left" then JoinChannel = false end end return JoinChannel end
function File_Bot_Run(msg,data) local msg_chat_id = msg.chat_id local msg_reply_id = msg.reply_to_message_id local msg_user_send_id = msg.sender.user_id local msg_id = msg.id local text = nil
if msg.sender.luatele == "messageSenderChat" then LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}) return false end
if msg.date and msg.date < tonumber(os.time() - 15) then print("->> Old Message End <<-") return false end
if data.content.text then text = data.content.text.text end
if tonumber(msg.sender.user_id) == tonumber(itsspider) then print('This is reply for Bot') return false end
if Statusrestricted(msg.chat_id,msg.sender.user_id).BanAll == true then return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}),LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender.user_id).ktmAll == true then return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Statusrestricted(msg.chat_id,msg.sender.user_id).BanGroup == true then return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}),LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender.user_id).SilentGroup == true then return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}) end
if tonumber(msg.sender.user_id) == 833156404 then msg.Name_Controller = 'مبرمج السورس' msg.The_Controller = 1
elseif tonumber(msg.sender.user_id) == 833156404 then msg.Name_Controller = 'مبرمج السورس' msg.The_Controller = 1
elseif The_ControllerAll(msg.sender.user_id) == true then msg.The_Controller = 1 msg.Name_Controller = 'المطور الاساسي'
elseif Redis:sismember(itsspider.."spider:DevelopersAS:Groups",msg.sender.user_id) == true then msg.The_Controller = 100 msg.Name_Controller = 'المطور الاساسي'
elseif Redis:sismember(itsspider.."spider:DevelopersQ:Groups",msg.sender.user_id) == true then msg.The_Controller = 2 msg.Name_Controller = 'المطور الاساسي²'
elseif Redis:sismember(itsspider.."spider:Developers:Groups",msg.sender.user_id) == true then msg.The_Controller = 3 msg.Name_Controller = Redis:get(itsspider.."spider:Developer:Bot:Reply"..msg.chat_id) or 'المطور'
elseif Redis:sismember(itsspider.."spider:TheBas:Group"..msg.chat_id,msg.sender.user_id) == true then msg.The_Controller = 99 msg.Name_Controller = Redis:get(itsspider.."spider:TheBas:Group:Reply"..msg.chat_id) or 'المالك'
elseif Redis:sismember(itsspider.."spider:TheBasicsQ:Group"..msg.chat_id,msg.sender.user_id) == true then msg.The_Controller = 44 msg.Name_Controller = Redis:get(itsspider.."spider:PresidentQ:Group:Reply"..msg.chat_id) or 'المالك'
elseif Redis:sismember(itsspider.."spider:TheBasics:Group"..msg.chat_id,msg.sender.user_id) == true then msg.The_Controller = 4 msg.Name_Controller = Redis:get(itsspider.."spider:President:Group:Reply"..msg.chat_id) or 'المنشئ الاساسي'
elseif Redis:sismember(itsspider.."spider:Originators:Group"..msg.chat_id,msg.sender.user_id) == true then msg.The_Controller = 5 msg.Name_Controller = Redis:get(itsspider.."spider:Constructor:Group:Reply"..msg.chat_id) or 'المنشئ'
elseif Redis:sismember(itsspider.."spider:Managers:Group"..msg.chat_id,msg.sender.user_id) == true then msg.The_Controller = 6 msg.Name_Controller = Redis:get(itsspider.."spider:Manager:Group:Reply"..msg.chat_id) or 'المدير'
elseif Redis:sismember(itsspider.."spider:Addictive:Group"..msg.chat_id,msg.sender.user_id) == true then msg.The_Controller = 7 msg.Name_Controller = Redis:get(itsspider.."spider:Admin:Group:Reply"..msg.chat_id) or 'الادمن'
elseif Redis:sismember(itsspider.."spider:Distinguished:Group"..msg.chat_id,msg.sender.user_id) == true then msg.The_Controller = 8 msg.Name_Controller = Redis:get(itsspider.."spider:Vip:Group:Reply"..msg.chat_id) or 'المميز'
elseif Redis:sismember(itsspider.."spider:Cleaner:Group"..msg.chat_id,msg.sender.user_id) == true then msg.The_Controller = 88 msg.Name_Controller = Redis:get(itsspider.."spider:Cle:Group:Reply"..msg.chat_id) or 'المنظف'
elseif tonumber(msg.sender.user_id) == tonumber(itsspider) then msg.The_Controller = 9 else msg.The_Controller = 10 msg.Name_Controller = Redis:get(itsspider.."spider:Mempar:Group:Reply"..msg.chat_id) or 'العضو' end  
if msg.The_Controller == 1 then msg.ControllerBot = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 then msg.DevelopersAS = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 or msg.The_Controller == 2 then msg.DevelopersQ = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 or msg.The_Controller == 2 or msg.The_Controller == 3 then msg.Developers = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 99 or msg.The_Controller == 44 or msg.The_Controller == 9 then msg.TheBasicsm = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 99 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 9 then msg.TheBasics = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 99 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 9 then msg.Originators = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 99 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 9 then msg.Managers = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 99 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 9 then msg.Addictive = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 99 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 88 or msg.The_Controller == 9 then msg.Cleaner = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 99 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 8 or msg.The_Controller == 9 then msg.Distinguished = true end
--
if text and (text:match("عيوره") or text:match("كس") or text:match("طيز") or text:match("ديس") or text:match("انيج") or text:match("نيج") or text:match("ديوس") or text:match("عير") or text:match("كسختك") or text:match("كسمك") or text:match("كسربك") or text:match("بلاع") or text:match("ابو العيوره") or text:match("منيوج") or text:match("كحبه") or text:match("كحاب") or text:match("الكحبه") or text:match("كسك") or text:match("طيزك") or text:match("كس امك") or text:match("صرم") or text:match("كس اختك")) then
if Redis:get(itsspider.."spider:Lock:Fshar"..msg_chat_id) and not msg.Addictive then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : ممنوع الفشار في المجموعة").ReplyOR33,"md",true)
return false end end
if text and (text:match("سني") or text:match("شيعه") or text:match("الشيعه") or text:match("السنه") or text:match("طائفتكم") or text:match("شيعي") or text:match("انا سني") or text:match("مسيحي") or text:match("يهودي") or text:match("صابئي") or text:match("ملحد") or text:match("بالسنه") or text:match("شيعة")) then
if Redis:get(itsspider.."spider:Lock:Taf"..msg_chat_id) and not msg.Addictive then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : ممنوع التكلم بالطائفيه هنا").ReplyOR33,"md",true)
return false end end
if text and (text:match("خره بالله") or text:match("خبربك") or text:match("كسدينربك") or text:match("خرب بالله") or text:match("خرب الله") or text:match("خره بربك") or text:match("الله الكواد") or text:match("خره بمحمد") or text:match("كسم الله") or text:match("كسم ربك") or text:match("كسربك") or text:match("كسختالله") or text:match("كسخت الله") or text:match("خره بدينك") or text:match("خرهبدينك") or text:match("كسالله") or text:match("خربالله")) then
if Redis:get(itsspider.."spider:Lock:Kfr"..msg_chat_id) and not msg.Addictive then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : ممنوع الكفر في المجموعة").ReplyOR33,"md",true)
return false end end
if text and (text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") or text:match("راحتی") or text:match("خسته") or text:match("بیام") or text:match("بپوشم") or text:match("كرمه")) then
if Redis:get(itsspider.."spider:Lock:Farsi"..msg_chat_id) and not msg.Addictive then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : ممنوع التكلم باللغه الفارسيه").ReplyOR33,"md",true)
return false end end
if text and (text:match("q") or text:match("w") or text:match("e") or text:match("r") or text:match("t") or text:match("y") or text:match("u") or text:match("i") or text:match("o") or text:match("p") or text:match("a") or text:match("s") or text:match("d") or text:match("f") or text:match("g") or text:match("h") or text:match("j") or text:match("k") or text:match("l") or text:match("z") or text:match("x") or text:match("c") or text:match("v") or text:match("b") or text:match("n") or text:match("m") or text:match("A") or text:match("S") or text:match("D") or text:match("R") or text:match("M")) then
if Redis:get(itsspider.."spider:Lock:F1arsi"..msg_chat_id) and not msg.Addictive then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : ممنوع التكلم باللغه الانگليزيه").ReplyOR33,"md",true)
return false end end
if Redis:get(itsspider.."spider:Lock:text"..msg_chat_id) and not msg.Addictive then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return false end 
if msg.content.luatele == "messageChatJoinByLink" then
if Redis:get(itsspider.."spider:Status:Welcome"..msg_chat_id) then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Welcome = Redis:get(itsspider.."spider:Welcome:Group"..msg_chat_id)
if Welcome then 
if UserInfo.username then UserInfousername = '@'..UserInfo.username else UserInfousername = 'لا يوجد ' end
Welcome = Welcome:gsub('name',UserInfo.first_name) 
Welcome = Welcome:gsub('user',UserInfousername) 
Welcome = Welcome:gsub('NameCh',Get_Chat.title) 
return LuaTele.sendText(msg_chat_id,msg_id,Welcome,"md") else
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : اطلق دخول ['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')\n⌁ : نورت الكروب ‹ '..Get_Chat.title..' ›',"md") end end end
if not msg.Distinguished and msg.content.luatele ~= "messageChatAddMembers" and Redis:hget(itsspider.."spider:Spam:Group:User"..msg_chat_id,"Spam:User") then 
if tonumber(msg.sender.user_id) == tonumber(itsspider) then return false end
local floods = Redis:hget(itsspider.."spider:Spam:Group:User"..msg_chat_id,"Spam:User") or "nil"
local Num_Msg_Max = Redis:hget(itsspider.."spider:Spam:Group:User"..msg_chat_id,"Num:Spam") or 5
local post_count = tonumber(Redis:get(itsspider.."spider:Spam:Cont"..msg.sender.user_id..":"..msg_chat_id) or 0)
if post_count >= tonumber(Redis:hget(itsspider.."spider:Spam:Group:User"..msg_chat_id,"Num:Spam") or 5) then 
local type = Redis:hget(itsspider.."spider:Spam:Group:User"..msg_chat_id,"Spam:User") 
if type == "kick" then 
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0), LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : قام بالتكرار في المجموعة وتم طرده").Reply,"md",true) end
if type == "del" then 
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}) end
if type == "keed" then return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0}), LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : قام بالتكرار في المجموعة وتم تقييده").Reply,"md",true)  end
if type == "mute" then
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : قام بالتكرار في المجموعة وتم كتمه").Reply,"md",true) end end
Redis:setex(itsspider.."spider:Spam:Cont"..msg.sender.user_id..":"..msg_chat_id, tonumber(5), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if Redis:hget(itsspider.."spider:Spam:Group:User"..msg_chat_id,"Num:Spam") then
Num_Msg_Max = Redis:hget(itsspider.."spider:Spam:Group:User"..msg_chat_id,"Num:Spam")  end end 
if text and not msg.Distinguished then
local _nl, ctrl_ = string.gsub(text, "%c", "")  
local _nl, real_ = string.gsub(text, "%d", "")   
sens = 400  
if Redis:get(itsspider.."spider:Lock:Spam"..msg.chat_id) == "del" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Redis:get(itsspider.."spider:Lock:Spam"..msg.chat_id) == "ked" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Redis:get(itsspider.."spider:Lock:Spam"..msg.chat_id) == "kick" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Redis:get(itsspider.."spider:Lock:Spam"..msg.chat_id) == "ktm" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}) end end
if msg.forward_info and not msg.TheBasics then -- التوجيه
local Fwd_Group = Redis:get(itsspider.."spider:Lock:forward"..msg_chat_id)
if Fwd_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : ممنوع توجيه الرسائل هنا").ReplyOR33,"md",true)
elseif Fwd_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Fwd_Group == "ktm" then
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Fwd_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is forward')
return false end 
if msg.reply_markup and msg.reply_markup.luatele == "replyMarkupInlineKeyboard" then
if not msg.Distinguished then  -- الكيبورد
local Keyboard_Group = Redis:get(itsspider.."spider:Lock:Keyboard"..msg_chat_id)
if Keyboard_Group == "del" then
var(LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}))
elseif Keyboard_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Keyboard_Group == "ktm" then
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Keyboard_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end end
print('This is reply_markup') end 
if msg.content.location and not msg.Distinguished then  -- الموقع
if location then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}) end
print('This is location') end 
if msg.content.entities and msg..content.entities[0] and msg.content.entities[0].type.luatele == "textEntityTypeUrl" and not msg.Distinguished then  -- الماركداون
local Markduan_Gtoup = Redis:get(itsspider.."spider:Lock:Markdaun"..msg_chat_id)
if Markduan_Gtoup == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Markduan_Gtoup == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Markduan_Gtoup == "ktm" then
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Markduan_Gtoup == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is textEntityTypeUrl') end 
if msg.content.game and not msg.Distinguished then  -- الالعاب
local Games_Group = Redis:get(itsspider.."spider:Lock:geam"..msg_chat_id)
if Games_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Games_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Games_Group == "ktm" then
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Games_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is games') end 
if msg.content.luatele == "messagePinMessage" then -- رساله التثبيت
local Pin_Msg = Redis:get(itsspider.."spider:lockpin"..msg_chat_id)
if Pin_Msg and not msg.Managers then
if Pin_Msg:match("(%d+)") then 
local PinMsg = LuaTele.pinChatMessage(msg_chat_id,Pin_Msg,true)
if PinMsg.luatele~= "ok" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : لا استطيع تثبيت الرسائل ليست لديه صلاحيه","md",true) end end
local UnPin = LuaTele.unpinChatMessage(msg_chat_id) 
if UnPin.luatele ~= "ok" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : لا استطيع الغاء تثبيت الرسائل ليست لديه صلاحيه","md",true) end
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : التثبيت معطل من قبل المدراء ","md",true) end
print('This is message Pin') end 
if msg.content.luatele == "messageChatJoinByLink" then
if Redis:get(itsspider.."spider:Lock:Join"..msg.chat_id) == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return false end end
if msg.content.luatele == "messageChatAddMembers" then -- اضافه اشخاص
print('This is Add Membeers ')
Redis:incr(itsspider.."spider:Num:Add:Memp"..msg_chat_id..":"..msg.sender.user_id) 
local AddMembrs = Redis:get(itsspider.."spider:Lock:AddMempar"..msg_chat_id) 
local Lock_Bots = Redis:get(itsspider.."spider:Lock:Bot:kick"..msg_chat_id)
for k,v in pairs(msg.content.member_user_ids) do
local Info_User = LuaTele.getUser(v) 
if Info_User.type.luatele == "userTypeBot" then
if Lock_Bots == "del" and not msg.Distinguished then
LuaTele.setChatMemberStatus(msg.chat_id,v,'banned',0)
elseif Lock_Bots == "kick" and not msg.Distinguished then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
LuaTele.setChatMemberStatus(msg.chat_id,v,'banned',0) end
elseif Info_User.type.luatele == "userTypeRegular" then
Redis:incr(itsspider.."spider:Num:Add:Memp"..msg.chat_id..":"..msg.sender.user_id) 
if AddMembrs == "kick" and not msg.Distinguished then
LuaTele.setChatMemberStatus(msg.chat_id,v,'banned',0) end end end end 
if msg.content.luatele == "messageContact" and not msg.Distinguished then  -- الجهات
local Contact_Group = Redis:get(itsspider.."spider:Lock:Contact"..msg_chat_id)
if Contact_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Contact_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Contact_Group == "ktm" then
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Contact_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is Contact') end 
if msg.content.luatele == "messageVideoNote" and not msg.Distinguished then  -- بصمه الفيديو
local Videonote_Group = Redis:get(itsspider.."spider:Lock:Unsupported"..msg_chat_id)
if Videonote_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : ممنوع ارسال الفيديوهات هنا").ReplyOR33,"md",true)
elseif Videonote_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Videonote_Group == "ktm" then
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Videonote_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is video Note') end 
if msg.content.luatele == "messageDocument" and not msg.Distinguished then  -- الملفات
local Document_Group = Redis:get(itsspider.."spider:Lock:Document"..msg_chat_id)
if Document_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : ممنوع ارسال الملفات هنا").ReplyOR33,"md",true)
elseif Document_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Document_Group == "ktm" then
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Document_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is Document') end 
if msg.content.luatele == "messageAudio" and not msg.Distinguished then  -- الملفات الصوتيه
local Audio_Group = Redis:get(itsspider.."spider:Lock:Audio"..msg_chat_id)
if Audio_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : ممنوع ارسال الاغاني هنا").ReplyOR33,"md",true)
elseif Audio_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Audio_Group == "ktm" then
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id)
elseif Audio_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is Audio') end 
if msg.content.luatele == "messageVideo" and not msg.Distinguished then  -- الفيديو
local Video_Grouo = Redis:get(itsspider.."spider:Lock:Video"..msg_chat_id)
if Video_Grouo == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : ممنوع ارسال الفيديوهات هنا").ReplyOR33,"md",true)
elseif Video_Grouo == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Video_Grouo == "ktm" then
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Video_Grouo == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is Video') end 
if msg.content.luatele == "messageVoiceNote" and not msg.Distinguished then  -- البصمات
local Voice_Group = Redis:get(itsspider.."spider:Lock:vico"..msg_chat_id)
if Voice_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : ممنوع ارسال البصمات هنا").ReplyOR33,"md",true)
elseif Voice_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Voice_Group == "ktm" then
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id)
elseif Voice_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is Voice') end 
if msg.content.luatele == "messageSticker" and not msg.Distinguished then  -- الملصقات
local Sticker_Group = Redis:get(itsspider.."spider:Lock:Sticker"..msg_chat_id)
if Sticker_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : ممنوع ارسال الملصقات هنا").ReplyOR33,"md",true)
elseif Sticker_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Sticker_Group == "ktm" then
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id)
elseif Sticker_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is Sticker') end 
if msg.via_bot_user_id ~= 0 and not msg.Distinguished then  -- انلاين
local Inlen_Group = Redis:get(itsspider.."spider:Lock:Inlen"..msg_chat_id)
if Inlen_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Inlen_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Inlen_Group == "ktm" then
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Inlen_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is viabot') end
if msg.content.luatele == "messageAnimation" and not msg.Distinguished then  -- المتحركات
local Gif_group = Redis:get(itsspider.."spider:Lock:Animation"..msg_chat_id)
if Gif_group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : ممنوع ارسال المتحركات هنا").ReplyOR33,"md",true)
elseif Gif_group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Gif_group == "ktm" then
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id)
elseif Gif_group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is Animation') end 
if msg.content.luatele == "messagePhoto" and not msg.Distinguished then  -- الصور
local Photo_Group = Redis:get(itsspider.."spider:Lock:Photo"..msg_chat_id)
if Photo_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : ممنوع ارسال الصور هنا").ReplyOR33,"md",true)
elseif Photo_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Photo_Group == "ktm" then
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Photo_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is Photo delete') end
if msg.content.photo and Redis:get(itsspider.."spider:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id) then
local ChatPhoto = LuaTele.setChatPhoto(msg_chat_id,msg.content.photo.sizes[2].photo.remote.id)
if (ChatPhoto.luatele == "error") then
Redis:del(itsspider.."spider:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا استطيع تغيير صوره المجموعة لاني لست ادمن او ليست لديه الصلاحيه ","md",true) end
Redis:del(itsspider.."spider:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تغيير صوره المجموعة المجموعة الى ","md",true) end
if (text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or text and text:match("[Tt].[Mm][Ee]/") 
or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or text and text:match(".[Pp][Ee]") 
or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or text and text:match("[Hh][Tt][Tt][Pp]://") 
or text and text:match("[Ww][Ww][Ww].") 
or text and text:match(".[Cc][Oo][Mm]")) or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match(".[Tt][Kk]") or text and text:match(".[Mm][Ll]") or text and text:match(".[Oo][Rr][Gg]") then 
local link_Group = Redis:get(itsspider.."spider:Lock:Link"..msg_chat_id)  
if not msg.Distinguished then
if link_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif link_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif link_Group == "ktm" then
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif link_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is link ')
return false end end
if text and text:match("@[%a%d_]+") and not msg.Distinguished then 
local UserName_Group = Redis:get(itsspider.."spider:Lock:User:Name"..msg_chat_id)
if UserName_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif UserName_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif UserName_Group == "ktm" then
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif UserName_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is username ') end
if text and text:match("#[%a%d_]+") and not msg.Distinguished then 
local Hashtak_Group = Redis:get(itsspider.."spider:Lock:hashtak"..msg_chat_id)
if Hashtak_Group == "del" then return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Hashtak_Group == "ked" then return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Hashtak_Group == "ktm" then
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Hashtak_Group == "kick" then return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is hashtak ') end
if text and text:match("/[%a%d_]+") and not msg.Distinguished then 
local comd_Group = Redis:get(itsspider.."spider:Lock:Cmd"..msg_chat_id)
if comd_Group == "del" then return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif comd_Group == "ked" then return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif comd_Group == "ktm" then
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif comd_Group == "kick" then return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end end
if (Redis:get(itsspider..'spider:FilterText'..msg_chat_id..':'..msg.sender.user_id) == 'true') then
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then Filters = 'صوره'
Redis:sadd(itsspider.."spider:List:Filter"..msg_chat_id,'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:set(itsspider.."spider:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, msg.content.photo.sizes[1].photo.id)  
elseif msg.content.animation then Filters = 'متحركه'
Redis:sadd(itsspider.."spider:List:Filter"..msg_chat_id,'animation:'..msg.content.animation.animation.id)  
Redis:set(itsspider.."spider:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, msg.content.animation.animation.id)  
elseif msg.content.sticker then Filters = 'ملصق'
Redis:sadd(itsspider.."spider:List:Filter"..msg_chat_id,'sticker:'..msg.content.sticker.sticker.id)  
Redis:set(itsspider.."spider:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, msg.content.sticker.sticker.id)  
elseif text then
Redis:set(itsspider.."spider:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, text)  
Redis:sadd(itsspider.."spider:List:Filter"..msg_chat_id,'text:'..text)  
Filters = 'رسالة' end
Redis:set(itsspider..'spider:FilterText'..msg_chat_id..':'..msg.sender.user_id,'true1')
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : ارسل تحذير ( "..Filters.." ) عند ارساله","md",true) end end
if text and (Redis:get(itsspider..'spider:FilterText'..msg_chat_id..':'..msg.sender.user_id) == 'true1') then
local Text_Filter = Redis:get(itsspider.."spider:Filter:Text"..msg.sender.user_id..':'..msg_chat_id)  
if Text_Filter then   
Redis:set(itsspider.."spider:Filter:Group:"..Text_Filter..msg_chat_id,text)  end  
Redis:del(itsspider.."spider:Filter:Text"..msg.sender.user_id..':'..msg_chat_id)  
Redis:del(itsspider..'spider:FilterText'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : تم اضافة رد التحذير","md",true)  end
if (Redis:get(itsspider..'spider:FilterText'..msg_chat_id..':'..msg.sender.user_id) == 'DelFilter') then   
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then Filters = 'الصوره'
Redis:srem(itsspider.."spider:List:Filter"..msg_chat_id,'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:del(itsspider.."spider:Filter:Group:"..msg.content.photo.sizes[1].photo.id..msg_chat_id)  
elseif msg.content.animation then Filters = 'المتحركه'
Redis:srem(itsspider.."spider:List:Filter"..msg_chat_id,'animation:'..msg.content.animation.animation.id)  
Redis:del(itsspider.."spider:Filter:Group:"..msg.content.animation.animation.id..msg_chat_id)  
elseif msg.content.sticker then Filters = 'الملصق'
Redis:srem(itsspider.."spider:List:Filter"..msg_chat_id,'sticker:'..msg.content.sticker.sticker.id)  
Redis:del(itsspider.."spider:Filter:Group:"..msg.content.sticker.sticker.id..msg_chat_id)  
elseif text then
Redis:srem(itsspider.."spider:List:Filter"..msg_chat_id,'text:'..text)  
Redis:del(itsspider.."spider:Filter:Group:"..text..msg_chat_id)  
Filters = 'الرسالة' end
Redis:del(itsspider..'spider:FilterText'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم الغاء منع ( "..Filters.." )","md",true) end end
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then DelFilters = msg.content.photo.sizes[1].photo.id statusfilter = 'الصوره'
elseif msg.content.animation then DelFilters = msg.content.animation.animation.id statusfilter = 'المتحركه'
elseif msg.content.sticker then DelFilters = msg.content.sticker.sticker.id statusfilter = 'الملصق'
elseif text then DelFilters = text statusfilter = 'الرسالة' end
local ReplyFilters = Redis:get(itsspider.."spider:Filter:Group:"..DelFilters..msg_chat_id)
if ReplyFilters and not msg.ControllerBot then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : لقد تم منع ( "..statusfilter.." ) هنا\n⌁ : "..ReplyFilters.."*","md",true)  end end
if text and Redis:get(itsspider.."spider:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender.user_id) == "true" then
local NewCmmd = Redis:get(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if NewCmmd then
Redis:del(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..text)
Redis:del(itsspider.."spider:Command:Reids:Group:New"..msg_chat_id)
Redis:srem(itsspider.."spider:Command:List:Group"..msg_chat_id,text)
LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم ازالة هذا ↫ ‹ "..text.." ›","md",true) else
LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد امر بهذا الاسم","md",true) end
Redis:del(itsspider.."spider:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender.user_id)
return false end
if text and Redis:get(itsspider.."spider:Command:Reids:Group"..msg_chat_id..":"..msg.sender.user_id) == "true" then
Redis:set(itsspider.."spider:Command:Reids:Group:New"..msg_chat_id,text)
Redis:del(itsspider.."spider:Command:Reids:Group"..msg_chat_id..":"..msg.sender.user_id)
Redis:set(itsspider.."spider:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender.user_id,"true1") 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل الامر الجديد","md",true)  end
if text and Redis:get(itsspider.."spider:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender.user_id) == "true1" then
local NewCmd = Redis:get(itsspider.."spider:Command:Reids:Group:New"..msg_chat_id)
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..text,NewCmd)
Redis:sadd(itsspider.."spider:Command:List:Group"..msg_chat_id,text)
Redis:del(itsspider.."spider:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حفظ الامر باسم ↫ ‹ "..text..' ›',"md",true) end
if Redis:get(itsspider.."spider:Set:Link"..msg_chat_id..""..msg.sender.user_id) then
if text and text:match("(https://telegram.me/%S+)") or text and text:match("(https://t.me/%S+)") then     
local LinkGroup = text:match("(https://telegram.me/%S+)") or text:match("(https://t.me/%S+)")   
Redis:set(itsspider.."spider:Group:Link"..msg_chat_id,LinkGroup)
Redis:del(itsspider.."spider:Set:Link"..msg_chat_id..""..msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حفظ الرابط بنجاح","md",true)        end end 
if Redis:get(itsspider.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender.user_id) then 
Redis:del(itsspider.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender.user_id)  
Redis:set(itsspider.."spider:Welcome:Group"..msg_chat_id,text) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حفظ ترحيب المجموعة","md",true) end
if Redis:get(itsspider.."spider:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
Redis:set(itsspider.."spider:Group:Rules" .. msg_chat_id,text) 
Redis:del(itsspider.."spider:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حفظ قوانين المجموعة","md",true)  end  
if Redis:get(itsspider.."spider:Set:Description:" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
LuaTele.setChatDescription(msg_chat_id,text) 
Redis:del(itsspider.."spider:Set:Description:" .. msg_chat_id .. ":" .. msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حفظ وصف المجموعة","md",true)  end  
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(itsspider.."spider:Text:Manager"..msg.sender.user_id..":"..msg_chat_id.."")
if Redis:get(itsspider.."spider:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id) == "true1" then
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = 'حذف الرد ↫ ‹ '..test..' ›', data = msg.sender.user_id..'/closerD'},},}}
Redis:del(itsspider.."spider:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id)
if msg.content.sticker then   
Redis:set(itsspider.."spider:Add:Rd:Manager:Stekrs"..test..msg_chat_id, msg.content.sticker.sticker.remote.id)  end   
if msg.content.voice_note then  
Redis:set(itsspider.."spider:Add:Rd:Manager:Vico"..test..msg_chat_id, msg.content.voice_note.voice.remote.id)  end   
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(itsspider.."spider:Add:Rd:Manager:Text"..test..msg_chat_id, text)  end  
if msg.content.audio then
Redis:set(itsspider.."spider:Add:Rd:Manager:Audio"..test..msg_chat_id, msg.content.audio.audio.remote.id)  end
if msg.content.document then
Redis:set(itsspider.."spider:Add:Rd:Manager:File"..test..msg_chat_id, msg.content.document.document.remote.id)  end
if msg.content.animation then
Redis:set(itsspider.."spider:Add:Rd:Manager:Gif"..test..msg_chat_id, msg.content.animation.animation.remote.id)  end
if msg.content.video_note then
Redis:set(itsspider.."spider:Add:Rd:Manager:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  end
if msg.content.video then
Redis:set(itsspider.."spider:Add:Rd:Manager:Video"..test..msg_chat_id, msg.content.video.video.remote.id)  end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id end
print(idPhoto)
Redis:set(itsspider.."spider:Add:Rd:Manager:Photo"..test..msg_chat_id, idPhoto)  end
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حفظ رد المدير الجديد","md",false ,false, false, false, reply_markup) end end
if text and text:match("^(.*)$") then
if Redis:get(itsspider.."spider:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id) == "true" then
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closerd'},},}}
Redis:set(itsspider.."spider:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id,"true1")
Redis:set(itsspider.."spider:Text:Manager"..msg.sender.user_id..":"..msg_chat_id, text)
Redis:del(itsspider.."spider:Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(itsspider.."spider:Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(itsspider.."spider:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(itsspider.."spider:Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(itsspider.."spider:Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:sadd(itsspider.."spider:List:Manager"..msg_chat_id.."", text)
LuaTele.sendText(msg_chat_id,msg_id,[[
⌁ : ارسل لي الرد سواء كان :
‹ ملف • ملصق • متحركه • صوره
• فيديو • بصمه • ص؛وت • رساله ›
⌁ : يمكنك اضافة الى النص ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 ‹ `#username` ›  ↬  معرف المستخدم
 ‹ `#msgs` ›  ↬  عدد الرسائل
 ‹ `#name` ›  ↬  اسم المستخدم
 ‹ `#id` ›  ↬  ايدي المستخدم
 ‹ `#stast` ›  ↬  رتبة المستخدم
 ‹ `#edit` ›  ↬  عدد السحكات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : للخروج اضغط ↫ ‹ الغاء ›
]],"md",false ,false, false, false, reply_markup) return false end end
if text and text:match("^(.*)$") then
if Redis:get(itsspider.."spider:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id.."") == "true2" then
Redis:del(itsspider.."spider:Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(itsspider.."spider:Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(itsspider.."spider:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(itsspider.."spider:Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(itsspider.."spider:Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(itsspider.."spider:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id)
Redis:srem(itsspider.."spider:List:Manager"..msg_chat_id.."", text)
LuaTele.sendText(msg_chat_id,msg_id,'⌁ : الكلمة ↫ ‹ '..text..' › تم حذفها',"md",true)  
return false end end
if text and Redis:get(itsspider.."spider:Status:ReplySudo"..msg_chat_id) then
local anemi = Redis:get(itsspider.."spider:Add:Rd:Sudo:Gif"..text)   
local veico = Redis:get(itsspider.."spider:Add:Rd:Sudo:vico"..text)   
local stekr = Redis:get(itsspider.."spider:Add:Rd:Sudo:stekr"..text)     
local Text = Redis:get(itsspider.."spider:Add:Rd:Sudo:Text"..text)   
local photo = Redis:get(itsspider.."spider:Add:Rd:Sudo:Photo"..text)
local video = Redis:get(itsspider.."spider:Add:Rd:Sudo:Video"..text)
local document = Redis:get(itsspider.."spider:Add:Rd:Sudo:File"..text)
local audio = Redis:get(itsspider.."spider:Add:Rd:Sudo:Audio"..text)
local video_note = Redis:get(itsspider.."spider:Add:Rd:Sudo:video_note"..text)
if Text then 
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local NumMsg = Redis:get(itsspider..'spider:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = msg.Name_Controller
if UserInfo.username then UserInfousername = '@'..UserInfo.username..'' else UserInfousername = 'لا يوجد' end
local NumMessageEdit = Redis:get(itsspider..'spider:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
local Text = Text:gsub('#username',UserInfousername)
local Text = Text:gsub('#name',UserInfo.first_name)
local Text = Text:gsub('#id',msg.sender.user_id)
local Text = Text:gsub('#edit',NumMessageEdit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
LuaTele.sendText(msg_chat_id,msg_id,Text,"md",true)  end
if video_note then LuaTele.sendVideoNote(msg_chat_id, msg.id, video_note) end
if photo then LuaTele.sendPhoto(msg.chat_id, msg.id, photo,'') end  
if stekr then LuaTele.sendSticker(msg_chat_id, msg.id, stekr) end
if veico then LuaTele.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md') end
if video then LuaTele.sendVideo(msg_chat_id, msg.id, video, '', "md") end
if anemi then LuaTele.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md') end
if document then LuaTele.sendDocument(msg_chat_id, msg.id, document, '', 'md') end  
if audio then LuaTele.sendAudio(msg_chat_id, msg.id, audio, '', "md")  end end
if text and Redis:get(itsspider.."spider:Status:Reply"..msg_chat_id) then
local anemi = Redis:get(itsspider.."spider:Add:Rd:Manager:Gif"..text..msg_chat_id)   
local veico = Redis:get(itsspider.."spider:Add:Rd:Manager:Vico"..text..msg_chat_id)   
local stekr = Redis:get(itsspider.."spider:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
local Texingt = Redis:get(itsspider.."spider:Add:Rd:Manager:Text"..text..msg_chat_id)   
local photo = Redis:get(itsspider.."spider:Add:Rd:Manager:Photo"..text..msg_chat_id)
local video = Redis:get(itsspider.."spider:Add:Rd:Manager:Video"..text..msg_chat_id)
local document = Redis:get(itsspider.."spider:Add:Rd:Manager:File"..text..msg_chat_id)
local audio = Redis:get(itsspider.."spider:Add:Rd:Manager:Audio"..text..msg_chat_id)
local video_note = Redis:get(itsspider.."spider:Add:Rd:Manager:video_note"..text..msg_chat_id)
if Texingt then 
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local NumMsg = Redis:get(itsspider..'spider:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
if UserInfo.username then UserInfousername = '@'..UserInfo.username..'' else UserInfousername = 'لا يوجد' end
local NumMessageEdit = Redis:get(itsspider..'spider:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
local Texingt = Texingt:gsub('#username',UserInfousername) 
local Texingt = Texingt:gsub('#name',UserInfo.first_name)
local Texingt = Texingt:gsub('#id',msg.sender.user_id)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
LuaTele.sendText(msg_chat_id,msg_id,Texingt,"md",true)  end
if video_note then LuaTele.sendVideoNote(msg_chat_id, msg.id, video_note) end
if photo then LuaTele.sendPhoto(msg.chat_id, msg.id, photo,'') end  
if stekr then LuaTele.sendSticker(msg_chat_id, msg.id, stekr) end
if veico then LuaTele.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md') end
if video then LuaTele.sendVideo(msg_chat_id, msg.id, video, '', "md") end
if anemi then LuaTele.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md') end
if document then LuaTele.sendDocument(msg_chat_id, msg.id, document, '', 'md') end  
if audio then LuaTele.sendAudio(msg_chat_id, msg.id, audio, '', "md")  end end
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(itsspider.."spider:Text:Sudo:Bot"..msg.sender.user_id..":"..msg_chat_id)
if Redis:get(itsspider.."spider:Set:Rd"..msg.sender.user_id..":"..msg_chat_id) == "true1" then Redis:del(itsspider.."spider:Set:Rd"..msg.sender.user_id..":"..msg_chat_id)
if msg.content.sticker then Redis:set(itsspider.."spider:Add:Rd:Sudo:stekr"..test, msg.content.sticker.sticker.remote.id)  end   
if msg.content.voice_note then Redis:set(itsspider.."spider:Add:Rd:Sudo:vico"..test, msg.content.voice_note.voice.remote.id)  end   
if msg.content.animation then Redis:set(itsspider.."spider:Add:Rd:Sudo:Gif"..test, msg.content.animation.animation.remote.id)  end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(itsspider.."spider:Add:Rd:Sudo:Text"..test, text)  end  
if msg.content.audio then Redis:set(itsspider.."spider:Add:Rd:Sudo:Audio"..test, msg.content.audio.audio.remote.id)  end
if msg.content.document then Redis:set(itsspider.."spider:Add:Rd:Sudo:File"..test, msg.content.document.document.remote.id)  end
if msg.content.video then Redis:set(itsspider.."spider:Add:Rd:Sudo:Video"..test, msg.content.video.video.remote.id)  end
if msg.content.video_note then Redis:set(itsspider.."spider:Add:Rd:Sudo:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then idPhoto = msg.content.photo.sizes[3].photo.remote.id end
Redis:set(itsspider.."spider:Add:Rd:Sudo:Photo"..test, idPhoto) end
LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حفظ رد للمطور \n⌁ : ارسل ( "..test.." ) لرؤية الرد","md",true)  
return false end end
if text and text:match("^(.*)$") then
if Redis:get(itsspider.."spider:Set:Rd"..msg.sender.user_id..":"..msg_chat_id) == "true" then
Redis:set(itsspider.."spider:Set:Rd"..msg.sender.user_id..":"..msg_chat_id, "true1")
Redis:set(itsspider.."spider:Text:Sudo:Bot"..msg.sender.user_id..":"..msg_chat_id, text)
Redis:sadd(itsspider.."spider:List:Rd:Sudo", text)
LuaTele.sendText(msg_chat_id,msg_id,[[
⌁ : ارسل لي الرد سواء كان :
‹ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه • صوت • رساله ›
⌁ : يمكنك اضافة الى النص ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 ‹ `#username` › ↬ معرف المستخدم
 ‹ `#msgs` › ↬ عدد الرسائل
 ‹ `#name` › ↬ اسم المستخدم
 ‹ `#id` › ↬ ايدي المستخدم
 ‹ `#stast` › ↬ رتبة المستخدم
 ‹ `#edit` › ↬ عدد السحكات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : للخروج ارسل ↫ ‹ الغاء ›
]],"md",true) return false end end
if text and text:match("^(.*)$") then
if Redis:get(itsspider.."spider:Set:On"..msg.sender.user_id..":"..msg_chat_id) == "true" then
list = {"Add:Rd:Sudo:video_note","Add:Rd:Sudo:Audio","Add:Rd:Sudo:File","Add:Rd:Sudo:Video","Add:Rd:Sudo:Photo","Add:Rd:Sudo:Text","Add:Rd:Sudo:stekr","Add:Rd:Sudo:vico","Add:Rd:Sudo:Gif"}
for k,v in pairs(list) do
Redis:del(itsspider..'spider:'..v..text) end
Redis:del(itsspider.."spider:Set:On"..msg.sender.user_id..":"..msg_chat_id)
Redis:srem(itsspider.."spider:List:Rd:Sudo", text)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حذف الرد من ردود المطور","md",true) end end
if Redis:get(itsspider.."spider:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == '‹ الغاء الامر ›' then   
Redis:del(itsspider.."spider:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n⌁ : تم الغاء الاذاعه للمجموعات","md",true)  end 
local list = Redis:smembers(itsspider.."spider:ChekBotAdd") 
if msg.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
Redis:set(itsspider.."spider:PinMsegees:"..v,msg.content.video_note.video.remote.id) end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id end
for k,v in pairs(list) do LuaTele.sendPhoto(v, 0, idPhoto,'')
Redis:set(itsspider.."spider:PinMsegees:"..v,idPhoto) end
elseif msg.content.sticker then 
for k,v in pairs(list) do LuaTele.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
Redis:set(itsspider.."spider:PinMsegees:"..v,msg.content.sticker.sticker.remote.id) end
elseif msg.content.voice_note then 
for k,v in pairs(list) do LuaTele.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
Redis:set(itsspider.."spider:PinMsegees:"..v,msg.content.voice_note.voice.remote.id) end
elseif msg.content.video then 
for k,v in pairs(list) do LuaTele.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
Redis:set(itsspider.."spider:PinMsegees:"..v,msg.content.video.video.remote.id) end
elseif msg.content.animation then 
for k,v in pairs(list) do LuaTele.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
Redis:set(itsspider.."spider:PinMsegees:"..v,msg.content.animation.animation.remote.id) end
elseif msg.content.document then
for k,v in pairs(list) do LuaTele.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
Redis:set(itsspider.."spider:PinMsegees:"..v,msg.content.document.document.remote.id) end
elseif msg.content.audio then
for k,v in pairs(list) do LuaTele.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
Redis:set(itsspider.."spider:PinMsegees:"..v,msg.content.audio.audio.remote.id) end
elseif text then
for k,v in pairs(list) do LuaTele.sendText(v,0,text,"md",true)
Redis:set(itsspider.."spider:PinMsegees:"..v,text) end end
LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تمت الاذاعه الى *- "..#list.." * مجموعة في البوت ","md",true)      
Redis:del(itsspider.."spider:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return false end
------------------------------------------------------------------------------------------------------------
if Redis:get(itsspider.."spider:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == '‹ الغاء الامر ›' then   
Redis:del(itsspider.."spider:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n⌁ : تم الغاء الاذاعه خاص","md",true)  end 
local list = Redis:smembers(itsspider..'spider:Num:User:Pv')  
if msg.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, msg.content.video_note.video.remote.id) end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id end
for k,v in pairs(list) do LuaTele.sendPhoto(v, 0, idPhoto,'') end
elseif msg.content.sticker then 
for k,v in pairs(list) do LuaTele.sendSticker(v, 0, msg.content.sticker.sticker.remote.id) end
elseif msg.content.voice_note then 
for k,v in pairs(list) do LuaTele.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md') end
elseif msg.content.video then 
for k,v in pairs(list) do LuaTele.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md") end
elseif msg.content.animation then 
for k,v in pairs(list) do LuaTele.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md') end
elseif msg.content.document then
for k,v in pairs(list) do LuaTele.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md') end
elseif msg.content.audio then
for k,v in pairs(list) do LuaTele.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") end
elseif text then
for k,v in pairs(list) do LuaTele.sendText(v,0,text,"md",true) end end
LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تمت الاذاعه الى *- "..#list.." * مشترك في البوت ","md",true)      
Redis:del(itsspider.."spider:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return false end
------------------------------------------------------------------------------------------------------------
if Redis:get(itsspider.."spider:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == '‹ الغاء الامر ›' then   
Redis:del(itsspider.."spider:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n⌁ : تم الغاء الاذاعه للمجموعات","md",true)  end 
local list = Redis:smembers(itsspider.."spider:ChekBotAdd") 
if msg.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, msg.content.video_note.video.remote.id) end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id end
for k,v in pairs(list) do LuaTele.sendPhoto(v, 0, idPhoto,'') end
elseif msg.content.sticker then 
for k,v in pairs(list) do LuaTele.sendSticker(v, 0, msg.content.sticker.sticker.remote.id) end
elseif msg.content.voice_note then 
for k,v in pairs(list) do LuaTele.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md') end
elseif msg.content.video then 
for k,v in pairs(list) do LuaTele.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md") end
elseif msg.content.animation then 
for k,v in pairs(list) do LuaTele.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md') end
elseif msg.content.document then
for k,v in pairs(list) do LuaTele.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md') end
elseif msg.content.audio then
for k,v in pairs(list) do LuaTele.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") end
elseif text then
for k,v in pairs(list) do LuaTele.sendText(v,0,text,"md",true) end end
LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تمت الاذاعه الى *- "..#list.." * مجموعة في البوت ","md",true)      
Redis:del(itsspider.."spider:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return false end
------------------------------------------------------------------------------------------------------------
if Redis:get(itsspider.."spider:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == '‹ الغاء الامر ›' then   
Redis:del(itsspider.."spider:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n⌁ : تم الغاء الاذاعه بالتوجيه للمجموعات","md",true) end 
if text or msg.content.sticker or msg.content.voice_note or msg.content.audio or msg.content.document or msg.content.animation or msg.content.video_note or msg.content.video or msg.forward_info then 
local list = Redis:smembers(itsspider.."spider:ChekBotAdd")   
LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم التوجيه الى *- "..#list.." * مجموعة في البوت ","md",true)      
for k,v in pairs(list) do LuaTele.forwardMessages(v, msg_chat_id, msg_id,0,0,true,false,false) end   
Redis:del(itsspider.."spider:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
end return false end
------------------------------------------------------------------------------------------------------------
if Redis:get(itsspider.."spider:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == '‹ الغاء الامر ›' then   
Redis:del(itsspider.."spider:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n⌁ : تم الغاء الاذاعه بالتوجيه خاص","md",true) end 
if text or msg.content.sticker or msg.content.voice_note or msg.content.audio or msg.content.document or msg.content.animation or msg.content.video_note or msg.content.video or msg.forward_info then 
local list = Redis:smembers(itsspider.."spider:Num:User:Pv")   
LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم التوجيه الى *- "..#list.." * مجموعة في البوت ","md",true) 
for k,v in pairs(list) do LuaTele.forwardMessages(v, msg_chat_id, msg_id,0,1,msg.media_album_id,false,true) end   
Redis:del(itsspider.."spider:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
end return false end
if text and Redis:get(itsspider..'spider:GetOwner:Owneritsspider'..msg_chat_id..':'..msg.sender.user_id) then
Redis:set(itsspider..'spider:Owner:Owneritsspider'..msg_chat_id,text)
Redis:del(itsspider..'spider:GetOwner:Owneritsspider'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : تم حفظ كليشة المنشئ') end
if text and Redis:get(itsspider..'spider:GetTexting:Devitsspider'..msg_chat_id..':'..msg.sender.user_id) then
Redis:set(itsspider..'spider:Texting:Devitsspider',text)
Redis:del(itsspider..'spider:GetTexting:Devitsspider'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : تم حفظ كليشة المطور') end
if Redis:get(itsspider.."spider:Redis:Id:Groups"..msg.chat_id..""..msg.sender.user_id) then 
if text == 'الغاء' or text == '‹ الغاء الامر ›' then 
LuaTele.sendText(msg_chat_id,msg_id, "\n⌁ : تم الغاء امر تعين الايدي عام","md",true)  
Redis:del(itsspider.."spider:Redis:Id:Groups"..msg.chat_id..""..msg.sender.user_id) 
return false end 
Redis:del(itsspider.."spider:Redis:Id:Groups"..msg.chat_id..""..msg.sender.user_id) 
Redis:set(itsspider.."spider:Set:Id:Groups"..msg.chat_id,text:match("(.*)"))
LuaTele.sendText(msg_chat_id,msg_id,'⌁ : تم تعين الايدي عام',"md",true)  end
if Redis:get(itsspider.."spider:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id) then 
if text == 'الغاء' or text == '‹ الغاء الامر ›' then 
LuaTele.sendText(msg_chat_id,msg_id, "\n⌁ : تم الغاء امر تعين الايدي","md",true)  
Redis:del(itsspider.."spider:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id) 
return false end 
Redis:del(itsspider.."spider:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id) 
Redis:set(itsspider.."spider:Set:Id:Group"..msg.chat_id,text:match("(.*)"))
LuaTele.sendText(msg_chat_id,msg_id,'⌁ : تم تعين الايدي الجديد',"md",true)  end
-- OR33
if Redis:get(itsspider.."spider:Change:CH:Bot"..msg.sender.user_id) then 
if text == "الغاء" or text == '‹ الغاء الامر ›' then   
Redis:del(itsspider.."spider:Change:CH:Bot"..msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n⌁ : تم الغاء امر تغير اسم القناة","md",true)  end 
Redis:del(itsspider.."spider:Change:CH:Bot"..msg.sender.user_id) 
Redis:set(itsspider.."spider:CH:Bot",text) 
return LuaTele.sendText(msg_chat_id,msg_id, "⌁ : تم تغير اسم القتاة الى ↫ ❨ "..text.." ❩","md",true) end 
--
if Redis:get(itsspider.."spider:Change:CHlink:Bot"..msg.sender.user_id) then 
if text == "الغاء" or text == '‹ الغاء الامر ›' then   
Redis:del(itsspider.."spider:Change:CHlink:Bot"..msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n⌁ : تم الغاء امر تغير كليشة الاشتراك","md",true)  end 
Redis:del(itsspider.."spider:Change:CHlink:Bot"..msg.sender.user_id) 
Redis:set(itsspider.."spider:CHlink:Bot",text) 
return LuaTele.sendText(msg_chat_id,msg_id, "⌁ : تم تغير الكليشة الى ↫ ⤈\n ❨ "..text.." ❩","md",true) end 
-- OR33
if Redis:get(itsspider.."spider:Change:Name:Bot"..msg.sender.user_id) then 
Redis:del(itsspider.."spider:Change:Name:Bot"..msg.sender.user_id) 
Redis:set(itsspider.."spider:Name:Bot",text) 
return LuaTele.sendText(msg_chat_id,msg_id, "⌁ : تم تغير اسم البوت الى ↫ ‹ "..text.." ›","md",true) end 
if Redis:get(itsspider.."spider:Change:Start:Bot"..msg.sender.user_id) then  
Redis:del(itsspider.."spider:Change:Start:Bot"..msg.sender.user_id) 
Redis:set(itsspider.."spider:Start:Bot",text) 
return LuaTele.sendText(msg_chat_id,msg_id, "⌁ : تم تغيير كليشة الترحيب الى ↫ ⤈\n"..text,"md",true) end 
if Redis:get(itsspider.."spider:Game:Smile"..msg.chat_id) then
if text == Redis:get(itsspider.."spider:Game:Smile"..msg.chat_id) then
Redis:incrby(itsspider.."spider:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(itsspider.."spider:Game:Smile"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : لقد فزت في اللعبه \n⌁ : اللعب مره اخره وارسل - سمايل او سمايلات","md",true) end end 
if Redis:get(itsspider.."spider:Game:Monotonous"..msg.chat_id) then
if text == Redis:get(itsspider.."spider:Game:Monotonous"..msg.chat_id) then
Redis:del(itsspider.."spider:Game:Monotonous"..msg.chat_id)
Redis:incrby(itsspider.."spider:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : لقد فزت في اللعبه \n⌁ : اللعب مره اخره وارسل - الاسرع او ترتيب","md",true) end end 
if Redis:get(itsspider.."spider:Game:Riddles"..msg.chat_id) then
if text == Redis:get(itsspider.."spider:Game:Riddles"..msg.chat_id) then
Redis:incrby(itsspider.."spider:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(itsspider.."spider:Game:Riddles"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : لقد فزت في اللعبه \n⌁ : اللعب مره اخره وارسل - حزوره","md",true) end end
if Redis:get(itsspider.."spider:Game:Meaningof"..msg.chat_id) then
if text == Redis:get(itsspider.."spider:Game:Meaningof"..msg.chat_id) then
Redis:incrby(itsspider.."spider:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(itsspider.."spider:Game:Meaningof"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : لقد فزت في اللعبه \n⌁ : اللعب مره اخره وارسل - معاني","md",true) end end
if Redis:get(itsspider.."spider:Game:Reflection"..msg.chat_id) then
if text == Redis:get(itsspider.."spider:Game:Reflection"..msg.chat_id) then
Redis:incrby(itsspider.."spider:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(itsspider.."spider:Game:Reflection"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : لقد فزت في اللعبه \n⌁ : اللعب مره اخره وارسل - العكس","md",true) end end
if Redis:get(itsspider.."spider:Game:Estimate"..msg.chat_id..msg.sender.user_id) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : عذراً لا يمكنك تخمين عدد اكبر من ال {20} خمن رقم ما بين ال{1 و 20}\n","md",true)  end 
local GETNUM = Redis:get(itsspider.."spider:Game:Estimate"..msg.chat_id..msg.sender.user_id)
if tonumber(NUM) == tonumber(GETNUM) then
Redis:del(itsspider.."spider:SADD:NUM"..msg.chat_id..msg.sender.user_id)
Redis:del(itsspider.."spider:Game:Estimate"..msg.chat_id..msg.sender.user_id)
Redis:incrby(itsspider.."spider:Num:Add:Games"..msg.chat_id..msg.sender.user_id,5)  
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : مبروك فزت ويانه وخمنت الرقم الصحيح\n⌁ : تم اضافة {5} من النقاط \n","md",true)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
Redis:incrby(itsspider.."spider:SADD:NUM"..msg.chat_id..msg.sender.user_id,1)
if tonumber(Redis:get(itsspider.."spider:SADD:NUM"..msg.chat_id..msg.sender.user_id)) >= 3 then
Redis:del(itsspider.."spider:SADD:NUM"..msg.chat_id..msg.sender.user_id)
Redis:del(itsspider.."spider:Game:Estimate"..msg.chat_id..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : اوبس لقد خسرت في اللعبه \n⌁ : حظآ اوفر في المره القادمه \n⌁ : كان الرقم الذي تم تخمينه {"..GETNUM.."}","md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : اوبس تخمينك غلط \n⌁ : ارسل رقم تخمنه مره اخرى ","md",true) end end end end
if Redis:get(itsspider.."spider:Game:Difference"..msg.chat_id) then
if text == Redis:get(itsspider.."spider:Game:Difference"..msg.chat_id) then 
Redis:del(itsspider.."spider:Game:Difference"..msg.chat_id)
Redis:incrby(itsspider.."spider:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : لقد فزت في اللعبه \n⌁ : اللعب مره اخره وارسل - المختلف","md",true)  
else
Redis:del(itsspider.."spider:Game:Difference"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : لقد خسرت حضا اوفر في المره القادمه\n⌁ : اللعب مره اخره وارسل - المختلف","md",true) end end
if Redis:get(itsspider.."spider:Game:Example"..msg.chat_id) then
if text == Redis:get(itsspider.."spider:Game:Example"..msg.chat_id) then 
Redis:del(itsspider.."spider:Game:Example"..msg.chat_id)
Redis:incrby(itsspider.."spider:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : لقد فزت في اللعبه \n⌁ : اللعب مره اخره وارسل - امثله","md",true)  
else
Redis:del(itsspider.."spider:Game:Example"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : لقد خسرت حضا اوفر في المره القادمه\n⌁ : اللعب مره اخره وارسل - امثله","md",true) end end
if text then
local NewCmmd = Redis:get(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if NewCmmd then
text = (NewCmmd or text) end end
if text == 'رفع النسخه الاحتياطيه' and msg.reply_to_message_id ~= 0 or text == 'رفع نسخه احتياطيه' and msg.reply_to_message_id ~= 0 then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
if Name_File ~= UserBot..'.json' then return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : عذرا هذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه') end -- end Namefile
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local FilesJson = JSON.decode(Get_Info)
if tonumber(itsspider) ~= tonumber(FilesJson.BotId) then return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : عذرا هذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه') end -- end botid
LuaTele.sendText(msg_chat_id,msg_id,'⌁ : جاري استرجاع المشتركين والكروبات ...')
Y = 0
for k,v in pairs(FilesJson.UsersBot) do
Y = Y + 1
Redis:sadd(itsspider..'spider:Num:User:Pv',v)  end
X = 0
for GroupId,ListGroup in pairs(FilesJson.GroupsBot) do
X = X + 1
Redis:sadd(itsspider.."spider:ChekBotAdd",GroupId) 
if ListGroup.President then
for k,v in pairs(ListGroup.President) do
Redis:sadd(itsspider.."spider:TheBasics:Group"..GroupId,v) end end
if ListGroup.Constructor then
for k,v in pairs(ListGroup.Constructor) do
Redis:sadd(itsspider.."spider:Originators:Group"..GroupId,v) end end
if ListGroup.Manager then
for k,v in pairs(ListGroup.Manager) do
Redis:sadd(itsspider.."spider:Managers:Group"..GroupId,v) end end
if ListGroup.Admin then
for k,v in pairs(ListGroup.Admin) do
Redis:sadd(itsspider.."spider:Addictive:Group"..GroupId,v) end end
if ListGroup.Cleaner then
for k,v in pairs(ListGroup.Cleaner) do
Redis:sadd(itsspider.."spider:Cleaner:Group"..GroupId,v) end end 
if ListGroup.Vips then
for k,v in pairs(ListGroup.Vips) do
Redis:sadd(itsspider.."spider:Distinguished:Group"..GroupId,v) end end 
end
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : تم استرجاع {'..X..'} مجموعة \n⌁ : واسترجاع {'..Y..'} مشترك في البوت') end end
if text == 'رفع نسخه تشاكي' and msg.reply_to_message_id ~= 0 then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
if tonumber(Name_File:match('(%d+)')) ~= tonumber(itsspider) then 
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : عذرا هذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه') end -- end Namefile
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local All_Groups = JSON.decode(Get_Info)
if All_Groups.GP_BOT then
for idg,v in pairs(All_Groups.GP_BOT) do
Redis:sadd(itsspider.."spider:ChekBotAdd",idg) 
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
Redis:sadd(itsspider.."spider:Originators:Group"..idg,idmsh) end;end
if v.MDER then
for k,idmder in pairs(v.MDER) do
Redis:sadd(itsspider.."spider:Managers:Group"..idg,idmder)  end;end
if v.MOD then
for k,idmod in pairs(v.MOD) do
Redis:sadd(itsspider.."spider:Addictive:Group"..idg,idmod) end;end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
Redis:sadd(itsspider.."spider:TheBasics:Group"..idg,idASAS) end;end
end
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : تم استرجاع المجموعات من نسخه تشاكي')
else
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : الملف لا يدعم هذا البوت') end end
end
if (Redis:get(itsspider..'spider:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id) == 'true') then
if text == 'الغاء' or text == '‹ الغاء الامر ›' then 
Redis:del(itsspider..'spider:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : تم الغاء حفظ قناة الاشتراك') end
Redis:del(itsspider..'spider:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = LuaTele.searchPublicChat(text)
if not UserId_Info.id then
Redis:del(itsspider..'spider:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
local ChannelUser = text:gsub('@','')
if UserId_Info.type.is_channel == true then
local StatusMember = LuaTele.getChatMember(UserId_Info.id,itsspider).status.luatele
if (StatusMember ~= "chatMemberStatusAdministrator") then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : البوت عضو في القناة يرجى رفع البوت ادمن واعادة وضع الاشتراك ","md",true)  end
Redis:set(itsspider..'spider:Channel:Join',ChannelUser) 
Redis:set(itsspider..'spider:ChanneliD:Join',UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : تم تعيين الاشتراك الاجباري على قناة : [@"..ChannelUser..']',"md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : هذا ليس معرف قناة يرجى ارسال معرف القناة الصحيح: [@"..ChannelUser..']',"md",true) end end end
if text == 'تفعيل الاشتراك الاجباري' or text == '‹ تفعيل الاشتراك الاجباري ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
Redis:set(itsspider..'spider:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : ارسل الي الان قناة الاشتراك ","md",true)  end
if text == 'تعطيل الاشتراك الاجباري' or text == '‹ تعطيل الاشتراك الاجباري ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
Redis:del(itsspider..'spider:Channel:Join')
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : تم تعطيل الاشتراك الاجباري","md",true)  end
-- OR33
if text == 'تغير اسم القناة' or text =='تغيير اسم القناة' or text =='‹ تغير اسم القناة ›' then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(itsspider.."spider:Change:CH:Bot"..msg.sender.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل لي اسم القناة الجديد\n⌁ : للخروج ارسل ↫ ‹ الغاء ›","md",true)  end
--
if text == 'حذف اسم القناة' or text =='مسح اسم القناة' or text =='‹ حذف اسم القناة ›' then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:CH:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حذف اسم القناة ","md",true)   
end
--
if text == 'تغير كليشة الاشتراك' or text =='تغيير كليشة الاشتراك' or text =='‹ تغير كليشة الاشتراك ›' then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(itsspider.."spider:Change:CHlink:Bot"..msg.sender.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل لي كليشة الاشتراك الجديده \n⌁ : للخروج ارسل ↫ ‹ الغاء ›","md",true)  end
--
if text == 'حذف كليشة الاشتراك' or text =='مسح كليشة الاشتراك' or text =='‹ حذف كليشة الاشتراك ›' then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:CHlink:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حذف كليشة الاشتراك ","md",true)   
end
-- OR33
if text == 'تغيير الاشتراك الاجباري' or text == '‹ تغيير الاشتراك الاجباري ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
Redis:set(itsspider..'spider:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : ارسل الي الان قناة الاشتراك ","md",true)  end
if text == 'الاشتراك الاجباري' or text == '‹ الاشتراك الاجباري ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local Channel = Redis:get(itsspider..'spider:Channel:Join')
if Channel then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : الاشتراك الاجباري مفعل على : [@"..Channel..']',"md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : لا توجد قناة في الاشتراك ارسل تغيير الاشتراك الاجباري","md",true) end end
if text == '‹ قناة السورس ›' or text == 'قناه السورس' or text == 'قناة السورس' then
photo = "https://t.me/FoRx_TeAm/4"
local tt =[[
⌁ : [Sourec F᥆Ꭱx](https://t.me/wwttw) .
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ Source Channel .', url = "https://t.me/wwttw"}},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo=https://t.me/wwttw&caption=".. URL.escape(tt).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) end
if text == '‹ مبرمج السورس ›' or text == 'مبرمج' or text == 'مبرمج السورس' or text == 'مطور السورس' or text == 'المبرمج' then
local tt =[[
⌁ : [مبرمج السورس](https://t.me/NNUUU) .
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مبرمج السورس .', url = "https://t.me/NNUUU"}},}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo=https://t.me/NNUUU&caption=".. URL.escape(tt).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) end
if text == '‹ تحديثات السورس ›' or text == 'قناة التحديثات' or text == 'تحديثات السورس' then
local tt =[[
⌁ : [Exp Source](https://t.me/wwttw) .
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ Exp Source .', url = "https://t.me/wwttw"}},}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo=https://t.me/wwttw&caption=".. URL.escape(tt).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) end
if text == "‹ اسم البوت ›" then
local NamesBot = (Redis:get(itsspider.."spider:Name:Bot") or "لار")
local BotName = {
"اسم البوت الحالي - "..NamesBot,
}
return LuaTele.sendText(msg_chat_id,msg_id,BotName[math.random(#BotName)],"md",true)   
end
if text == 'تعطيل الاذاعة' or text == '‹ تعطيل الاذاعة ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:SendBcBot") 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل الاذعة *").unLock,"md",true) end
if text == 'تفعيل الاذاعة' or text == '‹ تفعيل الاذاعة ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:SendBcBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل الاذاعة *").unLock,"md",true) end
if text == 'تعطيل المغادرة' or text == '‹ تعطيل المغادرة ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:LeftBot") 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل مغادرة البوت *").unLock,"md",true) end
if text == 'تفعيل المغادرة' or text == '‹ تفعيل المغادرة ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:LeftBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل مغادرة البوت *").unLock,"md",true) end
if (Redis:get(itsspider.."spider:AddSudosNew"..msg_chat_id) == 'true') then
Redis:del(itsspider.."spider:AddSudosNew"..msg_chat_id)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = LuaTele.searchPublicChat(text)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام معرف البوت ","md",true)  end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Token..[[",
UserBot = "]]..UserBot..[[",
UserSudo = "]]..text:gsub('@','')..[[",
SudoId = ]]..UserId_Info.id..[[
}
]])
Informationlua:close()
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : تم تغيير المطور الاساسي الى ↫ [@"..text:gsub('@','').."]","md",true) end end
if text == 'تغيير المطور الاساسي' or text == '‹ تغيير المطور الاساسي ›' or text == 'تغير المطور الاساسي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي فقط',"md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/DevIDClose'},},}}
Redis:set(itsspider.."spider:AddSudosNew"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل معرف المطور الاساسي مع @","md",false, false, false, false, reply_markup) end
if text == '‹ جلب النسخة الاحتياطية ›' or text == 'جلب نسخه احتياطيه' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Groups = Redis:smembers(itsspider..'spider:ChekBotAdd')  
local UsersBot = Redis:smembers(itsspider..'spider:Num:User:Pv')  
local Get_Json = '{"BotId": '..itsspider..','  
if #UsersBot ~= 0 then 
Get_Json = Get_Json..'"UsersBot":['  
for k,v in pairs(UsersBot) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"' end end   
Get_Json = Get_Json..']'
end
Get_Json = Get_Json..',"GroupsBot":{'
for k,v in pairs(Groups) do   
local President = Redis:smembers(itsspider.."spider:TheBasics:Group"..v)
local Constructor = Redis:smembers(itsspider.."spider:Originators:Group"..v)
local Manager = Redis:smembers(itsspider.."spider:Managers:Group"..v)
local Admin = Redis:smembers(itsspider.."spider:Addictive:Group"..v)
local Cleaner = Redis:smembers(itsspider.."spider:Cleaner:Group"..v)
local Vips = Redis:smembers(itsspider.."spider:Distinguished:Group"..v)
if k == 1 then
Get_Json = Get_Json..'"'..v..'":{'
else
Get_Json = Get_Json..',"'..v..'":{'
end
if #President ~= 0 then 
Get_Json = Get_Json..'"President":['
for k,v in pairs(President) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"' end end   
Get_Json = Get_Json..'],'
end
if #Constructor ~= 0 then
Get_Json = Get_Json..'"Constructor":['
for k,v in pairs(Constructor) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"' end end   
Get_Json = Get_Json..'],'
end
if #Manager ~= 0 then
Get_Json = Get_Json..'"Manager":['
for k,v in pairs(Manager) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"' end end   
Get_Json = Get_Json..'],'
end
if #Admin ~= 0 then
Get_Json = Get_Json..'"Admin":['
for k,v in pairs(Admin) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"' end end   
Get_Json = Get_Json..'],'
end
if #Cleaner ~= 0 then
Get_Json = Get_Json..'"Cleaner":['
for k,v in pairs(Cleaner) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"' end end   
Get_Json = Get_Json..'],'
end
if #Vips ~= 0 then
Get_Json = Get_Json..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"' end end   
Get_Json = Get_Json..'],'
end
Get_Json = Get_Json..'"Dev":"NNUUU"}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./'..UserBot..'.json', "w")
File:write(Get_Json)
File:close()
return LuaTele.sendDocument(msg_chat_id,msg_id,'./'..UserBot..'.json','⌁ : يحتوي الملف على ↫ ‹ '..#Groups..' › مجموعة\n⌁ : ويحتوي على ↫ ‹ '..#UsersBot..' › مشترك', 'md') end
if text == 'جلب نسخة الردود' or text == '‹ جلب نسخة الردود ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local Get_Json = '{"BotId": '..itsspider..','  
Get_Json = Get_Json..'"GroupsBotreply":{'
local Groups = Redis:smembers(itsspider..'spider:ChekBotAdd')  
for k,ide in pairs(Groups) do   
listrep = Redis:smembers(itsspider.."spider:List:Manager"..ide.."")
if k == 1 then
Get_Json = Get_Json..'"'..ide..'":{'
else
Get_Json = Get_Json..',"'..ide..'":{'
end
if #listrep >= 5 then
for k,v in pairs(listrep) do
if Redis:get(itsspider.."spider:Add:Rd:Manager:Gif"..v..ide) then
db = "gif@"..Redis:get(itsspider.."spider:Add:Rd:Manager:Gif"..v..ide)
elseif Redis:get(itsspider.."spider:Add:Rd:Manager:Vico"..v..ide) then
db = "Vico@"..Redis:get(itsspider.."spider:Add:Rd:Manager:Vico"..v..ide)
elseif Redis:get(itsspider.."spider:Add:Rd:Manager:Stekrs"..v..ide) then
db = "Stekrs@"..Redis:get(itsspider.."spider:Add:Rd:Manager:Stekrs"..v..ide)
elseif Redis:get(itsspider.."spider:Add:Rd:Manager:Text"..v..ide) then
db = "Text@"..Redis:get(itsspider.."spider:Add:Rd:Manager:Text"..v..ide)
db = string.gsub(db,'"','')
db = string.gsub(db,"'",'')
db = string.gsub(db,'*','')
db = string.gsub(db,'`','')
db = string.gsub(db,'{','')
db = string.gsub(db,'}','')
db = string.gsub(db,'\n',' ')
elseif Redis:get(itsspider.."spider:Add:Rd:Manager:Photo"..v..ide) then
db = "Photo@"..Redis:get(itsspider.."spider:Add:Rd:Manager:Photo"..v..ide) 
elseif Redis:get(itsspider.."spider:Add:Rd:Manager:Video"..v..ide) then
db = "Video@"..Redis:get(itsspider.."spider:Add:Rd:Manager:Video"..v..ide)
elseif Redis:get(itsspider.."spider:Add:Rd:Manager:File"..v..ide) then
db = "File@"..Redis:get(itsspider.."spider:Add:Rd:Manager:File"..v..ide)
elseif Redis:get(itsspider.."spider:Add:Rd:Manager:Audio"..v..ide) then
db = "Audio@"..Redis:get(itsspider.."spider:Add:Rd:Manager:Audio"..v..ide)
elseif Redis:get(itsspider.."spider:Add:Rd:Manager:video_note"..v..ide) then
db = "video_note@"..Redis:get(itsspider.."spider:Add:Rd:Manager:video_note"..v..ide) end
v = string.gsub(v,'"','')
v = string.gsub(v,"'",'')
Get_Json = Get_Json..'"'..v..'":"'..db..'",'
end   
Get_Json = Get_Json..'"taha":"ok"'
end
Get_Json = Get_Json..'}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./ReplysGr.json', "w")
File:write(Get_Json)
File:close()
return LuaTele.sendDocument(msg_chat_id,msg_id,'./ReplysGr.json', '', 'md') end
if text == 'رفع نسخة الردود' and msg.reply_to_message_id ~= 0 then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local Reply_Groups = JSON.decode(Get_Info) 
for GroupId,ListGroup in pairs(Reply_Groups.GroupsBotreply) do
if ListGroup.taha == "ok" then
for k,v in pairs(ListGroup) do
Redis:sadd(itsspider.."spider:List:Manager"..GroupId,k)
if v and v:match('gif@(.*)') then
Redis:set(itsspider.."spider:Add:Rd:Manager:Gif"..k..GroupId,v:match('gif@(.*)'))
elseif v and v:match('Vico@(.*)') then
Redis:set(itsspider.."spider:Add:Rd:Manager:Vico"..k..GroupId,v:match('Vico@(.*)'))
elseif v and v:match('Stekrs@(.*)') then
Redis:set(itsspider.."spider:Add:Rd:Manager:Stekrs"..k..GroupId,v:match('Stekrs@(.*)'))
elseif v and v:match('Text@(.*)') then
Redis:set(itsspider.."spider:Add:Rd:Manager:Text"..k..GroupId,v:match('Text@(.*)'))
elseif v and v:match('Photo@(.*)') then
Redis:set(itsspider.."spider:Add:Rd:Manager:Photo"..k..GroupId,v:match('Photo@(.*)'))
elseif v and v:match('Video@(.*)') then
Redis:set(itsspider.."spider:Add:Rd:Manager:Video"..k..GroupId,v:match('Video@(.*)'))
elseif v and v:match('File@(.*)') then
Redis:set(itsspider.."spider:Add:Rd:Manager:File"..k..GroupId,v:match('File@(.*)') )
elseif v and v:match('Audio@(.*)') then
Redis:set(itsspider.."spider:Add:Rd:Manager:Audio"..k..GroupId,v:match('Audio@(.*)'))
elseif v and v:match('video_note@(.*)') then
Redis:set(itsspider.."spider:Add:Rd:Manager:video_note"..k..GroupId,v:match('video_note@(.*)') ) end end end end
return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : تم استرجاع ردود المجموعات* ',"md",true) end end
if text and text:match("^تعين عدد الاعضاء (%d+)$") then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider..'spider:Num:Add:Bot',text:match("تعين عدد الاعضاء (%d+)$") ) 
LuaTele.sendText(msg_chat_id,msg_id,'*⌁ : تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعين عدد الاعضاء (%d+)$")..' عضو *',"md",true)  
elseif text =='الاحصائيات' then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
LuaTele.sendText(msg_chat_id,msg_id,'*⌁ : احصائيات البوت ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n⌁ : عدد المجموعات ↫ '..(Redis:scard(itsspider..'spider:ChekBotAdd') or 0)..'\n⌁ : عدد المشتركين ↫ '..(Redis:scard(itsspider..'spider:Num:User:Pv') or 0)..'*',"md",true)  end
if text == 'تفعيل' and msg.Developers then
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if Redis:sismember(itsspider.."spider:ChekBotAdd",msg_chat_id) then
if tonumber(Info_Chats.member_count) < tonumber((Redis:get(itsspider..'spider:Num:Add:Bot') or 0)) and not msg.DevelopersAS then return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : عدد الاعضاء قليل لا يمكن تفعيل المجموعة يجب ان يكوم اكثر من :'..Redis:get(itsspider..'spider:Num:Add:Bot'),"md",true)  end
return LuaTele.sendText(msg_chat_id,msg_id, '\n⌁ : المجموعة تم تفعيلها بالتأكيد' ,"md",true)  
else
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(itsspider.."spider:TheBas:Group"..msg_chat_id,v.member_id.user_id) 
x = x + 1 end end
end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رفع الادمنيه ›', data = msg.sender.user_id..'/addAdmins@'..msg_chat_id},{text = '‹ تفعيل الحمايه ›', data =msg.sender.user_id..'/LockAllGroup@'..msg_chat_id},},{{text = '‹ الاوامر ›', data = msg.sender.user_id..'/'.. 'helpall'},},{{text = '‹ غادر ›', data = msg.sender.user_id..'/Yesbot'},{text = '‹ تعطيل ›', data =msg.sender.user_id..'/disable'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
if UserInfo.username then
OR33 = '['..UserInfo.first_name..'](t.me/'..UserInfo.username..')'
else
OR33 = '['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')'
end
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
Status = 'المنشئ'
elseif (StatusMember == "chatMemberStatusAdministrator") then
Status = 'الادمن'
else
Status = 'العضو'
end
LuaTele.sendText(Sudo_Id,0,'\n⌁ : تم تفعيل مجموعة جديده ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n⌁ : بواسطة ↫ '..OR33..'\n⌁ : موقعه في المجموعة ↫ '..Status..'\n⌁ : ايدي المجموعة ↫ ⤈\n❨ `'..msg_chat_id..'` ❩\n⌁ : رابط المجموعة ↫ ⤈\n❨ '..Info_Chats.invite_link.invite_link..' ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n⌁ : الوقت ↫ '..os.date('%I:%M%p')..'\n⌁ : التاريخ ↫ '..os.date('%Y/%m/%d')..'',"md",true) end
Redis:sadd(itsspider.."spider:ChekBotAdd",msg_chat_id)
Redis:set(itsspider.."spider:Status:BanId"..msg_chat_id,true) ;Redis:set(itsspider.."spider:Status:SetId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,'*⌁ : تم تفعيل المجموعة ↫ ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ›*').unLock,'md', true, false, false, false, reply_markup) end end 
if text == ('تفعيل') and LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele == "chatMemberStatusCreator" or text == ('تفعيل') and LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele == "chatMemberStatusAdministrator" then
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if not Redis:get(itsspider.."spider:BotFree") then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : الوضع الخدمي تم تعطيله من قبل مطور البوت *","md",true)  end
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if Redis:sismember(itsspider.."spider:ChekBotAdd",msg_chat_id) then
if tonumber(Info_Chats.member_count) < tonumber((Redis:get(itsspider..'spider:Num:Add:Bot') or 0)) and not msg.DevelopersAS then return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : عدد الاعضاء قليل لا يمكن تفعيل المجموعة يجب ان يكوم اكثر من :'..Redis:get(itsspider..'spider:Num:Add:Bot'),"md",true)  end
return LuaTele.sendText(msg_chat_id,msg_id, '\n⌁ : المجموعة تم تفعيلها بالتأكيد' ,"md",true)  
else
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(itsspider.."spider:TheBas:Group"..msg_chat_id,v.member_id.user_id) 
x = x + 1 end end
end
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
if UserInfo.username then
OR33 = '['..UserInfo.first_name..'](t.me/'..UserInfo.username..')'
else
OR33 = '['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')'
end
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
Status = 'المنشئ'
elseif (StatusMember == "chatMemberStatusAdministrator") then
Status = 'الادمن'
else
Status = 'العضو'
end
LuaTele.sendText(Sudo_Id,0,'\n⌁ : تم تفعيل مجموعة جديده ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n⌁ : بواسطة ↫ '..OR33..'\n⌁ : موقعه في المجموعة ↫ '..Status..'\n⌁ : ايدي المجموعة ↫ ⤈\n❨ `'..msg_chat_id..'` ❩\n⌁ : رابط المجموعة ↫ ⤈\n❨ '..Info_Chats.invite_link.invite_link..' ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n⌁ : الوقت ↫ '..os.date('%I:%M%p')..'\n⌁ : التاريخ ↫ '..os.date('%Y/%m/%d')..'',"md",true) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رفع الادمنيه ›', data = msg.sender.user_id..'/addAdmins@'..msg_chat_id},{text = '‹ تفعيل الحمايه ›', data =msg.sender.user_id..'/LockAllGroup@'..msg_chat_id},},{{text = '‹ الاوامر ›', data = msg.sender.user_id..'/'.. 'helpall'},},{{text = '‹ غادر ›', data = msg.sender.user_id..'/Yesbot'},{text = '‹ تعطيل ›', data =msg.sender.user_id..'/disable'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
Redis:sadd(itsspider.."spider:ChekBotAdd",msg_chat_id)
Redis:set(itsspider.."spider:Status:BanId"..msg_chat_id,true) ;Redis:set(itsspider.."spider:Status:SetId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,'*⌁ : تم تفعيل المجموعة ↫ ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ›*').unLock,'md', true, false, false, false, reply_markup) end end
if text == 'تعطيل' and msg.Developers then
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if not Redis:sismember(itsspider.."spider:ChekBotAdd",msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id, '\n⌁ : المجموعة تم تعطيلها بالتأكيد',"md",true)  
else
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
if UserInfo.username then
OR33 = '['..UserInfo.first_name..'](t.me/'..UserInfo.username..')'
else
OR33 = '['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')'
end
LuaTele.sendText(Sudo_Id,0,"⌁ : تم تعطيل مجموعة جديده ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n⌁ : بواسطة ↫ "..OR33.."\n⌁ : اسم المجموعة ↫ "..Get_Chat.title.."\n⌁ : ايدي المجموعة ↫ ⤈ \n❨ `"..msg_chat_id.."` ❩\n⌁ : رابط المجموعة ↫ ⤈\n❨ "..Info_Chats.invite_link.invite_link.." ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n⌁ : الوقت ↫ "..os.date("%I:%M%p").."\n⌁ : التاريخ ↫ "..os.date("%Y/%m/%d").."","md",true) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ غادر ›', data = msg.sender.user_id..'/Yesbott'},{text = '‹ تفعيل ›', data =msg.sender.user_id..'/activation'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
Redis:srem(itsspider.."spider:ChekBotAdd",msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,'*⌁ : تم تعطيل المجموعة ↫ ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ›*').unLock,'md',true, false, false, false, reply_markup) end end
if text == ('تعطيل') and LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele == "chatMemberStatusCreator" and not msg.Developers or text == ('تعطيل') and LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele == "chatMemberStatusAdministrator" and not msg.Developers then
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if not Redis:sismember(itsspider.."spider:ChekBotAdd",msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : المجموعة تم تعطيلها بالتأكيد*',"md",true)  
else
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
if UserInfo.username then
OR33 = '['..UserInfo.first_name..'](t.me/'..UserInfo.username..')'
else
OR33 = '['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')'
end
LuaTele.sendText(Sudo_Id,0,"⌁ : تم تعطيل مجموعة جديده ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n⌁ : بواسطة ↫ "..OR33.."\n⌁ : اسم المجموعة ↫ "..Get_Chat.title.."\n⌁ : ايدي المجموعة ↫ ⤈ \n❨ `"..msg_chat_id.."` ❩\n⌁ : رابط المجموعة ↫ ⤈\n❨ "..Info_Chats.invite_link.invite_link.." ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n⌁ : الوقت ↫ "..os.date("%I:%M%p").."\n⌁ : التاريخ ↫ "..os.date("%Y/%m/%d").."","md",true) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ غادر ›', data = msg.sender.user_id..'/Yesbott'},{text = '‹ تفعيل ›', data =msg.sender.user_id..'/activation'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
Redis:srem(itsspider.."spider:ChekBotAdd",msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,'*⌁ : تم تعطيل المجموعة ↫ ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ›*').unLock,'md',true, false, false, false, reply_markup) end end
if chat_type(msg.chat_id) == "GroupBot" and Redis:sismember(itsspider.."spider:ChekBotAdd",msg_chat_id) then
if text == "ايدي" and msg.reply_to_message_id == 0 then
if not Redis:get(itsspider.."spider:Status:Id"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : عذراً امر الايدي معطل","md",true) end
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local photo = LuaTele.getUserProfilePhotos(msg.sender.user_id)
local UserId = msg.sender.user_id
local RinkBot = msg.Name_Controller
local TotalMsg = Redis:get(itsspider..'spider:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalPhoto = photo.total_count or 0
local TotalEdit = Redis:get(itsspider..'spider:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
local TotalMsgT = Total_message(TotalMsg) 
local NumberGames = Redis:get(itsspider.."spider:Num:Add:Games"..msg.chat_id..msg.sender.user_id) or 0
local NumAdd = Redis:get(itsspider.."spider:Num:Add:Memp"..msg.chat_id..":"..msg.sender.user_id) or 0
local Texting = {'ملاك وناسيك بكروبنه😟',"حلغوم والله☹️ ","اطلق صوره🐼❤️","كيكك والله🥺","لازك بيها غيرها عاد😒",}
local Description = Texting[math.random(#Texting)]
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
Get_Is_Id = Redis:get(itsspider.."spider:Set:Id:Group"..msg_chat_id)
if Redis:get(itsspider.."spider:Status:IdPhoto"..msg_chat_id) then
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#AddMem',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#id',msg.sender.user_id) 
local Get_Is_Id = Get_Is_Id:gsub('#username',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#msgs',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#edit',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#stast',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#auto',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#Description',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#game',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#photos',TotalPhoto) 
if photo.total_count > 0 then
return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,Get_Is_Id)
else
return LuaTele.sendText(msg_chat_id,msg_id,Get_Is_Id,"md",true) 
end
else
if photo.total_count > 0 then
return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,
'\n*⌁ : '..Description..
'\n⌁ : ايديك : '..UserId..
'\n⌁ : معرفك : '..UserInfousername..
'\n⌁ : رتبتك : '..RinkBot..
'\n⌁ : صورك : '..TotalPhoto..
'\n⌁ : رسائلك : '..TotalMsg..
'\n⌁ : تعديلاتك : '..TotalEdit..
'\n⌁ : تفاعلك : '..TotalMsgT..
'*', "md")
else
return LuaTele.sendText(msg_chat_id,msg_id,
'\n*⌁ : ايديك : '..UserId..
'\n⌁ : معرفك : '..UserInfousername..
'\n⌁ : رتبتك : '..RinkBot..
'\n⌁ : رسائلك : '..TotalMsg..
'\n⌁ : تعديلاتك : '..TotalEdit..
'\n⌁ : تفاعلك : '..TotalMsgT..
'*',"md",true) 
end
end
else
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#AddMem',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#id',msg.sender.user_id) 
local Get_Is_Id = Get_Is_Id:gsub('#username',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#msgs',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#edit',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#stast',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#auto',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#Description',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#game',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#photos',TotalPhoto) 
return LuaTele.sendText(msg_chat_id,msg_id,'['..Get_Is_Id..']',"md",true) 
else
return LuaTele.sendText(msg_chat_id,msg_id,
'\n*⌁ : ايديك : '..UserId..
'\n⌁ : معرفك : '..UserInfousername..
'\n⌁ : رتبتك : '..RinkBot..
'\n⌁ : رسائلك : '..TotalMsg..
'\n⌁ : تعديلاتك : '..TotalEdit..
'\n⌁ : تفاعلك : '..TotalMsgT..
'*',"md",true) 
end
end
end
if text == 'ايدي' or text == 'كشف'  and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
local UserId = Message_Reply.sender.user_id
local RinkBot = Controller(msg_chat_id,Message_Reply.sender.user_id)
local TotalMsg = Redis:get(itsspider..'spider:Num:Message:User'..msg_chat_id..':'..Message_Reply.sender.user_id) or 0
local TotalEdit = Redis:get(itsspider..'spider:Num:Message:Edit'..msg_chat_id..Message_Reply.sender.user_id) or 0
local TotalMsgT = Total_message(TotalMsg) 
return LuaTele.sendText(msg_chat_id,msg_id,
'\n*⌁ : ايديه : '..UserId..
'\n⌁ : معرفه : '..UserInfousername..
'\n⌁ : رتبته : '..RinkBot..
'\n⌁ : رسائله : '..TotalMsg..
'\n⌁ : تعديلاته : '..TotalEdit..
'\n⌁ : تفاعله : '..TotalMsgT..
'*',"md",true) 
end
if text and text:match('^ايدي @(%S+)$') or text and text:match('^كشف @(%S+)$') then
local UserName = text:match('^ايدي @(%S+)$') or text:match('^كشف @(%S+)$')
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرآ لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local UserId = UserId_Info.id
local RinkBot = Controller(msg_chat_id,UserId_Info.id)
local TotalMsg = Redis:get(itsspider..'spider:Num:Message:User'..msg_chat_id..':'..UserId_Info.id) or 0
local TotalEdit = Redis:get(itsspider..'spider:Num:Message:Edit'..msg_chat_id..UserId_Info.id) or 0
local TotalMsgT = Total_message(TotalMsg) 
return LuaTele.sendText(msg_chat_id,msg_id,
'\n*⌁ : ايديه : '..UserId..
'\n⌁ : معرفه : @'..UserName..
'\n⌁ : رتبته : '..RinkBot..
'\n⌁ : رسائله : '..TotalMsg..
'\n⌁ : تعديلاته : '..TotalEdit..
'\n⌁ : تفاعله : '..TotalMsgT..
'*',"md",true) 
end
if text == 'نبذتي' or text == 'بايو' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذه الميزة للادمنية واعلى فقط',"md",true)  end
local InfoUser = LuaTele.getUserFullInfo(msg.sender.user_id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = 'لا يوجد'
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : نبذتك ↫ ❨ '..Bio..' ❩',"md",true)  end
if text == 'اسمي' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذه الميزة للادمنية واعلى فقط',"md",true)  end
local UserInfo = LuaTele.getUser(msg.sender.user_id) 
if UserInfo.first_name then
Name = UserInfo.first_name
else
Name = ''
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : اسمك ↫ ❨ '..Name..' ❩ ',"md",true)  end
if text == 'رتبتي' then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : رتبتك ↫ ❨ '..msg.Name_Controller..' ❩',"md",true)  end
if text == 'ايديي' then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : ايديك ↫ ❨ '..msg.sender.user_id..' ❩',"md",true)  end
if text == 'معرفي' then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : معرفك ↫ ❨ '..UserInfousername..' ❩',"md",true)  end
if text == 'معلوماتي' or text == 'موقعي' then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
StatusMemberChat = 'مالك المجموعة'
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'ادمن المجموعة'
else
StatusMemberChat = 'مجرد عضو'
end
local UserId = msg.sender.user_id
local RinkBot = msg.Name_Controller
local TotalMsg = Redis:get(itsspider..'spider:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalEdit = Redis:get(itsspider..'spider:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
local TotalMsgT = Total_message(TotalMsg) 
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
return LuaTele.sendText(msg_chat_id,msg_id,
'\n⌁ : ايديك ↫ '..UserId..
'\n⌁ : معرفك ↫ '..UserInfousername..
'\n⌁ : رتبتك ↫ '..RinkBot..
'\n⌁ : موقعك ↫ '..StatusMemberChat..
'\n⌁ : رسائلك ↫ '..TotalMsg..
'\n⌁ : سحكاتك ↫ '..TotalEdit..
'\n⌁ : تفاعلك ↫ '..TotalMsgT..
'' ,"md",true) 
end
if text == 'فحص البوت' then 
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local StatusMember = LuaTele.getChatMember(msg_chat_id,spider).status.luatele
if (StatusMember ~= "chatMemberStatusAdministrator") then return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : البوت عضو في المجموعة ',"md",true) 
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,spider).status
if GetMemberStatus.can_change_info then
change_info = '‹ ✓ ›' else change_info = '‹ ✗ ›'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '‹ ✓ ›' else delete_messages = '‹ ✗ ›'
end
if GetMemberStatus.can_invite_users then
invite_users = '‹ ✓ ›' else invite_users = '‹ ✗ ›'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '‹ ✓ ›' else pin_messages = '‹ ✗ ›'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '‹ ✓ ›' else restrict_members = '‹ ✗ ›'
end
if GetMemberStatus.can_promote_members then
promote = '‹ ✓ ›' else promote = '‹ ✗ ›'
end
PermissionsUser = '\n⌁ : صلاحيات البوت ↫ ⤈'..'\n⌁ : تغيير المعلومات ↫ '..change_info..'\n⌁ : تثبيت الرسائل ↫ '..pin_messages..'\n⌁ : اضافة مستخدمين ↫ '..invite_users..'\n⌁ : مسح الرسائل ↫ '..delete_messages..'\n⌁ : حظر المستخدمين ↫ '..restrict_members..'\n⌁ : اضافة المشرفين ↫ '..promote..'\n\n'
return LuaTele.sendText(msg_chat_id,msg_id,PermissionsUser,"md",true) 
end
if text and text:match('^تنظيف (%d+)$') then
local NumMessage = text:match('^تنظيف (%d+)$')
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).Delmsg == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  end
if tonumber(NumMessage) > 1000 then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : العدد اكثر من ‹ *1000* › لا تستطيع الحذف',"md",true)  end
local Message = msg.id
for i=1,tonumber(NumMessage) do
local deleteMessages = LuaTele.deleteMessages(msg.chat_id,{[1]= Message})
var(deleteMessages)
Message = Message - 1048576
end
LuaTele.sendText(msg_chat_id, msg_id, "⌁ : تم تنظيف ‹ "..NumMessage.. ' › من الرسائل', 'md') end
if text and text:match('^تنزيل (.*) @(%S+)$') then
local UserName = {text:match('^تنزيل (.*) @(%S+)$')}
local UserId_Info = LuaTele.searchPublicChat(UserName[2])
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام معرف البوت ","md",true)  end
if UserName[1] == "مطور اساسي" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:DevelopersAS:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"*⌁ : تم تنزيله مطور اساسي بالتأكيد *").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:DevelopersAS:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"*⌁ : تم تنزيله مطور اساسي *").Reply,"md",true) end end
if UserName[1] == "مطور ثانوي" then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:DevelopersQ:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"*⌁ : تم تنزيله مطور ثانوي بالتأكيد *").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:DevelopersQ:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"*⌁ : تم تنزيله مطور ثانوي *").Reply,"md",true) end end
if UserName[1] == "مطور" then
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:Developers:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم تنزيله مطور بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:Developers:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم تنزيله مطور ").Reply,"md",true) end end
if UserName[1] == "مالك" then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if not Redis:sismember(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم تنزيله مالك بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم تنزيله مالك ").Reply,"md",true) end end
if UserName[1] == "منشئ اساسي" then
if not msg.TheBasicsm then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر المالكين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:TheBasics:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم تنزيله منشئ اساسي بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:TheBasics:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم تنزيله منشئ اساسي ").Reply,"md",true) end end
if UserName[1] == "منشئ" then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:Originators:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم تنزيله من المنشئين بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:Originators:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم تنزيله من المنشئين ").Reply,"md",true) end end
if UserName[1] == "مدير" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:Managers:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم تنزيله من المدراء بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم تنزيله من المدراء ").Reply,"md",true) end end
if UserName[1] == "ادمن" then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:Addictive:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم تنزيله من الادمنيه بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم تنزيله من الادمنيه ").Reply,"md",true) end end
if UserName[1] == "منظف" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:Cleaner:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم تنزيله من منظف بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:Cleaner:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم تنزيله من منظف ").Reply,"md",true) end end
if UserName[1] == "مميز" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:Distinguished:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم تنزيله من المميزين بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم تنزيله من المميزين ").Reply,"md",true) end end end
if text and text:match("^تنزيل (.*)$") and msg.reply_to_message_id ~= 0 then
local TextMsg = text:match("^تنزيل (.*)$")
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام الامر على البوت ","md",true)  end
if TextMsg == 'مطور اساسي' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:DevelopersAS:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله مطور اساسي بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:DevelopersAS:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله مطور اساسي").Reply,"md",true) end end
if TextMsg == 'مطور ثانوي' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:DevelopersQ:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله مطور ثانوي بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:DevelopersQ:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله مطور ثانوي").Reply,"md",true) end end
if TextMsg == 'مطور' then
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:Developers:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله مطور بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:Developers:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله مطور ").Reply,"md",true) end end
if TextMsg == "مالك" then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if not Redis:sismember(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله مالك بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله مالك ").Reply,"md",true) end end
if TextMsg == "منشئ اساسي" then
if not msg.TheBasicsm then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر المالكين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله منشئ اساسي بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله منشئ اساسي ").Reply,"md",true) end end
if TextMsg == "منشئ" then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله من المنشئين بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله من المنشئين ").Reply,"md",true) end end
if TextMsg == "مدير" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله من المدراء بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله من المدراء ").Reply,"md",true) end end
if TextMsg == "ادمن" then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله من الادمنيه بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله من الادمنيه ").Reply,"md",true) end end
if TextMsg == "منظف" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:Cleaner:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله من منظف بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:Cleaner:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله من منظف ").Reply,"md",true) end end
if TextMsg == "مميز" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله من المميزين بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله من المميزين ").Reply,"md",true) end end end
if text and text:match('^تنزيل (.*) (%d+)$') then
local UserId = {text:match('^تنزيل (.*) (%d+)$')}
local UserInfo = LuaTele.getUser(UserId[2])
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام ايدي خطأ ","md",true)  end
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام الامر على البوت ","md",true)  end
if UserId[1] == 'مطور اساسي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:DevelopersAS:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"*⌁ : تم تنزيله مطور اساسي بالتأكيد *").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:DevelopersAS:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"*⌁ : تم تنزيله مطور اساسي *").Reply,"md",true) end end
if UserId[1] == 'مطور ثانوي' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:DevelopersQ:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"*⌁ : تم تنزيله مطور ثانوي بالتأكيد *").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:DevelopersQ:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"*⌁ : تم تنزيله مطور ثانوي *").Reply,"md",true) end end
if UserId[1] == 'مطور' then
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:Developers:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم تنزيله مطور بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:Developers:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم تنزيله مطور ").Reply,"md",true) end end
if UserId[1] == "مالك" then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if not Redis:sismember(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم تنزيله مالك بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم تنزيله مالك ").Reply,"md",true) end end
if UserId[1] == "منشئ اساسي" then
if not msg.TheBasicsm then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر المالكين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:TheBasics:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم تنزيله منشئ اساسي بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:TheBasics:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم تنزيله منشئ اساسي ").Reply,"md",true) end end
if UserId[1] == "منشئ" then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:Originators:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم تنزيله من المنشئين بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:Originators:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم تنزيله من المنشئين ").Reply,"md",true) end end
if UserId[1] == "مدير" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:Managers:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم تنزيله من المدراء بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم تنزيله من المدراء ").Reply,"md",true) end end
if UserId[1] == "ادمن" then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:Addictive:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم تنزيله من الادمنيه بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم تنزيله من الادمنيه ").Reply,"md",true) end end
if UserId[1] == "منظف" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:Cleaner:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم تنزيله من منظف بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:Cleaner:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم تنزيله من منظف ").Reply,"md",true) end end
if UserId[1] == "مميز" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(itsspider.."spider:Distinguished:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم تنزيله من المميزين بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم تنزيله من المميزين ").Reply,"md",true) end end end
if text and text:match('^رفع (.*) @(%S+)$') then
local UserName = {text:match('^رفع (.*) @(%S+)$')}
local UserId_Info = LuaTele.searchPublicChat(UserName[2])
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام معرف البوت ","md",true)  end
if UserName[1] == "مطور اساسي" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:DevelopersAS:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه مطور اساسي بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:DevelopersAS:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه مطور اساسي").Reply,"md",true) end end
if UserName[1] == "مطور ثانوي" then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:DevelopersQ:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه مطور ثانوي بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:DevelopersQ:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه مطور ثانوي").Reply,"md",true) end end
if UserName[1] == "مطور" then
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:Developers:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه مطور بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:Developers:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه مطور ").Reply,"md",true) end end
if UserName[1] == "مالك" then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if Redis:sismember(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه مالك بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه مالك ").Reply,"md",true) end end
if UserName[1] == "منشئ اساسي" then
if not msg.TheBasicsm then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر المالكين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:TheBasics:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه في قائمة المنشئين الاساسيين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:TheBasics:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه في قائمة المنشئين الاساسيين ").Reply,"md",true) end end
if UserName[1] == "منشئ" then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:Originators:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه في قائمة المنشئين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:Originators:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه في قائمة المنشئين  ").Reply,"md",true) end end
if UserName[1] == "مدير" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:Managers:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه في قائمة المدراء بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:Managers:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه في قائمة المدراء  ").Reply,"md",true) end end
if UserName[1] == "ادمن" then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Originators and not Redis:get(itsspider.."spider:Status:SetId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل (الرفع) من قبل المنشئين","md",true) end 
if Redis:sismember(itsspider.."spider:Addictive:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه في قائمة الادمنية بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:Addictive:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه في قائمة الادمنية  ").Reply,"md",true) end end
if UserName[1] == "منظف" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:Cleaner:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه منظف بالتأكيد").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:Cleaner:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه في قائمة المنظفين").Reply,"md",true) end end
if UserName[1] == "مميز" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Originators and not Redis:get(itsspider.."spider:Status:SetId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل (الرفع) من قبل المنشئين","md",true) end 
if Redis:sismember(itsspider.."spider:Distinguished:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه في قائمة المميزين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:Distinguished:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم رفعه في قائمة المميزين  ").Reply,"md",true) end end end
if text and text:match("^رفع (.*)$") and msg.reply_to_message_id ~= 0 then
local TextMsg = text:match("^رفع (.*)$")
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام الامر على البوت ","md",true)  end
if TextMsg == 'مطور اساسي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:DevelopersAS:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه مطور اساسي بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:DevelopersAS:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه مطور اساسي").Reply,"md",true) end end
if TextMsg == 'مطور ثانوي' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:DevelopersQ:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه مطور ثانوي بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:DevelopersQ:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه مطور ثانوي").Reply,"md",true) end end
if TextMsg == 'مطور' then
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:Developers:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه مطور بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:Developers:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه مطور ").Reply,"md",true) end end
if TextMsg == "مالك" then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if Redis:sismember(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه مالك بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه مالك ").Reply,"md",true) end end
if TextMsg == "منشئ اساسي" then
if not msg.TheBasicsm then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر المالكين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه في قائمة المنشئين الاساسيين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه في قائمة المنشئين الاساسيين ").Reply,"md",true) end end
if TextMsg == "منشئ" then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه في قائمة المنشئين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه في قائمة المنشئين  ").Reply,"md",true) end end
if TextMsg == "مدير" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه في قائمة المدراء بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه في قائمة المدراء  ").Reply,"md",true) end end
if TextMsg == "ادمن" then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Originators and not Redis:get(itsspider.."spider:Status:SetId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل (الرفع) من قبل المنشئين","md",true) end 
if Redis:sismember(itsspider.."spider:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه في قائمة الادمنية بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه في قائمة الادمنية  ").Reply,"md",true) end end
if TextMsg == "منظف" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:Cleaner:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه منظف بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:Cleaner:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه في قائمة المنظفين ").Reply,"md",true) end end
if TextMsg == "مميز" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Originators and not Redis:get(itsspider.."spider:Status:SetId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل (الرفع) من قبل المنشئين","md",true) end 
if Redis:sismember(itsspider.."spider:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه في قائمة المميزين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم رفعه في قائمة المميزين  ").Reply,"md",true) end end end
if text and text:match('^رفع (.*) (%d+)$') then
local UserId = {text:match('^رفع (.*) (%d+)$')}
local UserInfo = LuaTele.getUser(UserId[2])
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام ايدي خطأ ","md",true)  end
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام الامر على البوت ","md",true)  end
if UserId[1] == 'مطور اساسي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:DevelopersAS:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم رفعه مطور اساسي بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:DevelopersAS:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم رفعه مطور اساسي").Reply,"md",true) end end
if UserId[1] == 'مطور ثانوي' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:DevelopersQ:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم رفعه مطور ثانوي بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:DevelopersQ:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم رفعه مطور ثانوي").Reply,"md",true) end end
if UserId[1] == 'مطور' then
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:Developers:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم رفعه مطور بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:Developers:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم رفعه مطور ").Reply,"md",true) end end
if UserId[1] == "مالك" then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم رفعه مالك بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم رفعه مالك ").Reply,"md",true) end end
if UserId[1] == "منشئ اساسي" then
if not msg.TheBasicsm then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر المالكين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:TheBasics:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم رفعه في قائمة المنشئين الاساسيين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:TheBasics:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم رفعه في قائمة المنشئين الاساسيين ").Reply,"md",true) end end
if UserId[1] == "منشئ" then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:Originators:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم رفعه في قائمة المنشئين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:Originators:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم رفعه في قائمة المنشئين  ").Reply,"md",true) end end
if UserId[1] == "مدير" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:Managers:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم رفعه في قائمة المدراء بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:Managers:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم رفعه في قائمة المدراء  ").Reply,"md",true) end end
if UserId[1] == "ادمن" then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Originators and not Redis:get(itsspider.."spider:Status:SetId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل (الرفع) من قبل المنشئين","md",true) end 
if Redis:sismember(itsspider.."spider:Addictive:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم رفعه في قائمة الادمنية بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:Addictive:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم رفعه في قائمة الادمنية  ").Reply,"md",true) end end
if UserId[1] == "منظف" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(itsspider.."spider:Cleaner:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم رفعه منظف بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:Cleaner:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم رفعه في قائمة المنظفين ").Reply,"md",true) end end
if UserId[1] == "مميز" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Originators and not Redis:get(itsspider.."spider:Status:SetId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل (الرفع) من قبل المنشئين","md",true) end 
if Redis:sismember(itsspider.."spider:Distinguished:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم رفعه في قائمة المميزين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:Distinguished:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"⌁ : تم رفعه في قائمة المميزين  ").Reply,"md",true) end end end
if text and text:match("^تغير رد المطور (.*)$") then
local Teext = text:match("^تغير رد المطور (.*)$") 
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
Redis:set(itsspider.."spider:Developer:Bot:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تغير رد المطور الى :"..Teext)
elseif text and text:match("^تغير رد المنشئ الاساسي (.*)$") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
local Teext = text:match("^تغير رد المنشئ الاساسي (.*)$") 
Redis:set(itsspider.."spider:President:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تغير رد المنشئ الاساسي الى :"..Teext)
elseif text and text:match("^تغير رد المنشئ (.*)$") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
local Teext = text:match("^تغير رد المنشئ (.*)$") 
Redis:set(itsspider.."spider:Constructor:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تغير رد المنشئ الى :"..Teext)
elseif text and text:match("^تغير رد المدير (.*)$") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
local Teext = text:match("^تغير رد المدير (.*)$") 
Redis:set(itsspider.."spider:Manager:Group:Reply"..msg.chat_id,Teext) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تغير رد المدير الى :"..Teext)
elseif text and text:match("^تغير رد الادمن (.*)$") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
local Teext = text:match("^تغير رد الادمن (.*)$") 
Redis:set(itsspider.."spider:Admin:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تغير رد الادمن الى :"..Teext)
elseif text and text:match("^تغير رد المميز (.*)$") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
local Teext = text:match("^تغير رد المميز (.*)$") 
Redis:set(itsspider.."spider:Vip:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تغير رد المميز الى :"..Teext)
elseif text and text:match("^تغير رد العضو (.*)$") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
local Teext = text:match("^تغير رد العضو (.*)$") 
Redis:set(itsspider.."spider:Mempar:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تغير رد العضو الى :"..Teext)
elseif text == 'حذف رد المطور' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
Redis:del(itsspider.."spider:Developer:Bot:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حدف رد المطور")
elseif text == 'حذف رد المنشئ الاساسي' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
Redis:del(itsspider.."spider:President:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حذف رد المنشئ الاساسي ")
elseif text == 'حذف رد المنشئ' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
Redis:del(itsspider.."spider:Constructor:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حذف رد المنشئ ")
elseif text == 'حذف رد المدير' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
Redis:del(itsspider.."spider:Manager:Group:Reply"..msg.chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حذف رد المدير ")
elseif text == 'حذف رد الادمن' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
Redis:del(itsspider.."spider:Admin:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حذف رد الادمن ")
elseif text == 'حذف رد المميز' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
Redis:del(itsspider.."spider:Vip:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حذف رد المميز")
elseif text == 'حذف رد العضو' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
Redis:del(itsspider.."spider:Mempar:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حذف رد العضو") end
if text == 'المطورين الاساسين' or text == 'المطورين الاساسيين' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:DevelopersAS:Groups") 
local OR33 = Redis:scard(itsspider.."spider:DevelopersAS:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مطورين اساسيين حالياً , ","md",true)  end
ListMembers = '\n*⌁ : قائمة المطورين الاساسيين ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح الاساسيين : '..OR33..' ›', data = msg.sender.user_id..'/DevelopersAS'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المطورين الثانويين' or text == 'المطورين الثانوين' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:DevelopersQ:Groups") 
local OR33 = Redis:scard(itsspider.."spider:DevelopersQ:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مطورين ثانويين حالياً , ","md",true)  end
ListMembers = '\n*⌁ : قائمة المطورين الثانويين ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح الثانويين : '..OR33..' ›', data = msg.sender.user_id..'/DevelopersQ'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المطورين' then
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:Developers:Groups") 
local OR33 = Redis:scard(itsspider.."spider:Developers:Groups")  
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مطورين حالياً , ","md",true)  end
ListMembers = '\n*⌁ : قائمة مطورين البوت ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المطورين : '..OR33..' ›', data = msg.sender.user_id..'/Developers'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المالكين' then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id) 
local OR33 = Redis:scard(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id)
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : لا يوجد مالكين في البوت *","md",true)  end
ListMembers = '\n*⌁ : قائمة المالكين في البوت ↫ ⤈*\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المالكين : '..OR33..' ›', data = msg.sender.user_id..'/TheBasicsQ'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المنشئين الاساسيين' or text == 'المنشئين الاساسين' then
if LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele ~= "chatMemberStatusCreator" or not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:TheBasics:Group"..msg_chat_id) 
local OR33 = Redis:scard(itsspider.."spider:TheBasics:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد منشئين اساسيين حالياً , ","md",true)  end
ListMembers = '\n*⌁ : قائمة المنشئين الاساسيين ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح الاساسيين : '..OR33..' ›', data = msg.sender.user_id..'/TheBasics'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المنشئين' then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:Originators:Group"..msg_chat_id) 
local OR33 = Redis:scard(itsspider.."spider:Originators:Group"..msg_chat_id)
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد منشئين حالياً , ","md",true)  end
ListMembers = '\n*⌁ : قائمة المنشئين في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المنشئين : '..OR33..' ›', data = msg.sender.user_id..'/Originators'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المدراء' then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:Managers:Group"..msg_chat_id) 
local OR33 = Redis:scard(itsspider.."spider:Managers:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مدراء حالياً , ","md",true)  end
ListMembers = '\n*⌁ : قائمة المدراء في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المدراء : '..OR33..' ›', data = msg.sender.user_id..'/Managers'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'الادمنيه' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:Addictive:Group"..msg_chat_id) 
local OR33 = Redis:scard(itsspider.."spider:Addictive:Group"..msg_chat_id)
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد ادمنيه حالياً , ","md",true)  end
ListMembers = '\n*⌁ : قائمة الادمنيه في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح الادمنيه : '..OR33..' ›', data = msg.sender.user_id..'/Addictive'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المنظفين' then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:Cleaner:Group"..msg_chat_id) 
local OR33 = Redis:scard(itsspider.."spider:Cleaner:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مدراء منظفين , ","md",true)  end
ListMembers = '\n*⌁ : قائمة المنظفين في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المنظفين : '..OR33..' ›', data = msg.sender.user_id..'/Cleaner'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المميزين' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:Distinguished:Group"..msg_chat_id) 
local OR33 = Redis:scard(itsspider.."spider:Distinguished:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مميزين حالياً , ","md",true)  end
ListMembers = '\n*⌁ : قائمة المميزين في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المميزين : '..OR33..' ›', data = msg.sender.user_id..'/DelDistinguished'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'قائمة عام' or text == 'قائمة العام' or text == 'قائمه عام' or text == 'قائمه العام' then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:BanAll:Groups") 
if #Info_Members == 0 then
ListMembers = '*⌁ : لا يوجد محظورين عام حالياً\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*'
else
ListMembers = '*⌁ : قائمة المحظورين عام ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
end
local Info_Memberss = Redis:smembers(itsspider.."spider:ktmAll:Groups") 
if #Info_Memberss == 0 then
ListMemberss = '*⌁ : لا يوجد مكتومين عام حالياً\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*'
else
ListMemberss = '*⌁ : قائمة المكتومين عام ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Memberss) do
local User_Info = LuaTele.getUser(v)
if User_Info and User_Info.username and User_Info.username ~= "" then
ListMemberss = ListMemberss.."*"..k.." - *[@"..User_Info.username.."](tg://user?id="..v..")\n"
else
ListMemberss = ListMemberss.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح قائمة العام ›', data = msg.sender.user_id..'/BanAllktm'},},}}
return LuaTele.sendText(msg_chat_id, msg_id,''..ListMembers..'\n'..ListMemberss..'', 'md', false, false, false, false, reply_markup) end
if text == 'المحظورين عام' or text == 'المحظورين العام' then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:BanAll:Groups") 
local OR33 = Redis:scard(itsspider.."spider:BanAll:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد محظورين عام حالياً , ","md",true)  end
ListMembers = '\n*⌁ : قائمة المحظورين عام ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المحظورين عام : '..OR33..' ›', data = msg.sender.user_id..'/BanAll'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المكتومين عام' or text == 'المكتومين العام' then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:ktmAll:Groups") 
local OR33 = Redis:scard(itsspider.."spider:ktmAll:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مكتومين عام حالياً , ","md",true)  end
ListMembers = '\n*⌁ : قائمة المكتومين عام ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المكتومين عام : '..OR33..' ›', data = msg.sender.user_id..'/ktmAll'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المحظورين' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:BanGroup:Group"..msg_chat_id) 
local OR33 = Redis:scard(itsspider.."spider:BanGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد محظورين حالياً , ","md",true)  end
ListMembers = '\n*⌁ : قائمة المحظورين في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المحظورين : '..OR33..' ›', data = msg.sender.user_id..'/BanGroup'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المكتومين' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:SilentGroup:Group"..msg_chat_id) 
local OR33 = Redis:scard(itsspider.."spider:SilentGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مكتومين حالياً , ","md",true)  end
ListMembers = '\n*⌁ : قائمة المكتومين في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المكتومين : '..OR33..' ›', data = msg.sender.user_id..'/SilentGroupGroup'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
-- OR33
if text == 'عدد الكروب' or text == 'عدد المجموعه' or text == 'عدد المجموعة' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : المجموعه ↫ ❨ '..Get_Chat.title..' ❩\n⌁ : الايدي ↫ ❨ `'..msg_chat_id..'` ❩\n⌁ : عدد الاعضاء ↫ ❨ *'..Info_Chats.member_count..'* ❩\n⌁ : عدد الادمنيه ↫ ❨ *'..Info_Chats.administrator_count..'* ❩\n⌁ : عدد المقيدين ↫ ❨ *'..Info_Chats.restricted_count..'* ❩\n⌁ : عدد المطرودين ↫ ❨ *'..Info_Chats.banned_count..'* ❩\n⌁ : عدد رسائل المجموعه ↫ ❨ *'..(msg.id/2097152/0.5)..'* ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n',"md",true) end
-- OR33
if text and text:match("^تفعيل (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^تفعيل (.*)$")
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if TextMsg == 'اوامر التسليه' then
Redis:set(itsspider.."spider:Status:distraction10"..msg_chat_id,true) 
Redis:set(itsspider.."spider:Status:distraction9"..msg_chat_id,true) 
Redis:set(itsspider.."spider:Status:distraction8"..msg_chat_id,true) 
Redis:set(itsspider.."spider:Status:distraction7"..msg_chat_id,true) 
Redis:set(itsspider.."spider:Status:distraction6"..msg_chat_id,true) 
Redis:set(itsspider.."spider:Status:distraction5"..msg_chat_id,true) 
Redis:set(itsspider.."spider:Status:distraction4"..msg_chat_id,true) 
Redis:set(itsspider.."spider:Status:distraction3"..msg_chat_id,true) 
Redis:set(itsspider.."spider:Status:distraction2"..msg_chat_id,true) 
Redis:set(itsspider.."spider:Status:distraction1"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل اوامر التسليه *").unLock,"md",true) end
if TextMsg == 'غنيلي' then
Redis:set(itsspider.."spider:Status:distraction1"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل امر غنيلي *").unLock,"md",true) end
if TextMsg == 'متحركه' then
Redis:set(itsspider.."spider:Status:distraction2"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل امر متحركه *").unLock,"md",true) end
if TextMsg == 'شعر' then
Redis:set(itsspider.."spider:Status:distraction3"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل امر شعر *").unLock,"md",true) end
if TextMsg == 'فلم' then
Redis:set(itsspider.."spider:Status:distraction4"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل امر شعر *").unLock,"md",true) end
if TextMsg == 'صوره' then
Redis:set(itsspider.."spider:Status:distraction5"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل امر صوره *").unLock,"md",true) end
if TextMsg == 'اغنيه' then
Redis:set(itsspider.."spider:Status:distraction6"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل امر اغنيه *").unLock,"md",true) end
if TextMsg == 'انمي' then
Redis:set(itsspider.."spider:Status:distraction7"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل امر انمي *").unLock,"md",true) end
if TextMsg == 'ريمكس' then
Redis:set(itsspider.."spider:Status:distraction8"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل امر ريمكس *").unLock,"md",true) end
if TextMsg == 'ميمز' then
Redis:set(itsspider.."spider:Status:distraction9"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل امر ميمز *").unLock,"md",true) end
if TextMsg == 'مسلسل' then
Redis:set(itsspider.."spider:Status:distraction10"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل امر مسلسل *").unLock,"md",true) end
if TextMsg == 'الرابط' then
Redis:set(itsspider.."spider:Status:Link"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل الرابط *").unLock,"md",true) end
if TextMsg == 'الترحيب' then
Redis:set(itsspider.."spider:Status:Welcome"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل الترحيب* ").unLock,"md",true) end
if TextMsg == 'الايدي' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Status:Id"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل الايدي *").unLock,"md",true) end
if TextMsg == 'الايدي بالصوره' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Status:IdPhoto"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل الايدي بالصوره* ").unLock,"md",true) end
if TextMsg == 'ردود المدير' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Status:Reply"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل ردود المدير *").unLock,"md",true) end
if TextMsg == 'ردود المطور' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Status:ReplySudo"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل ردود المطور *").unLock,"md",true) end
if TextMsg == 'الحظر' or TextMsg == 'الطرد' or TextMsg == 'التقييد' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Status:BanId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل الحظر , الطرد , التقييد *").unLock,"md",true) end
if TextMsg == 'الرفع' then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Status:SetId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل الرفع *").unLock,"md",true) end
if TextMsg == 'الالعاب' then
Redis:set(itsspider.."spider:Status:Games"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل الالعاب *").unLock,"md",true) end
if TextMsg == 'اطردني' then
Redis:set(itsspider.."spider:Status:KickMe"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل اطردني *").unLock,"md",true) end
if TextMsg == 'صورتي' then
Redis:set(itsspider.."spider:Status:photo"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل امر صورتي *").unLock,"md",true) end
if TextMsg == 'كول' then
Redis:set(itsspider.."spider:Status:kool"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل امر كول *").unLock,"md",true) end
if TextMsg == 'جمالي' then
Redis:set(itsspider.."spider:Status:gamle"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل جمالي *").unLock,"md",true) end
if TextMsg == 'ردود السورس' then
Redis:set(itsspider.."spider:rb:bna"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ :  تم تفعيل ردود السورس ","md",true)
end
if TextMsg == 'نزلني' then
Redis:set(itsspider.."spider:Status:remMe"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل نزلني *").unLock,"md",true) end
if TextMsg == 'البوت الخدمي' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:BotFree",true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل البوت الخدمي *").unLock,"md",true) end
if TextMsg == 'التواصل' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:TwaslBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تفعيل التواصل داخل البوت* ").unLock,"md",true) end end
-- OR33
if text and text:match("^(.*)$") then
if Redis:get(itsspider.."spider1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true" then
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closerd0'},},}}
Redis:set(itsspider.."spider1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id, "true1")
Redis:set(itsspider.."spider1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id, text)
Redis:sadd(itsspider.."spider1:List:Rd:Sudo"..msg.chat_id, text)
return LuaTele.sendText(msg_chat_id,msg_id, '\n⌁ : تم حفظ الكلمة \n⌁ : الان ارسل الرد رقم ↫ ‹ 1 ›', "md", false, false, false, false, reply_markup) end end
if text and text:match("^(.*)$") then
if Redis:get(itsspider.."spider1:Set:On"..msg.sender.user_id..":"..msg.chat_id) == "true" then
Redis:del(itsspider..'spider1:Add:Rd:Sudo:Text'..text..msg.chat_id)
Redis:del(itsspider..'spider1:Add:Rd:Sudo:Text1'..text..msg.chat_id)
Redis:del(itsspider..'spider1:Add:Rd:Sudo:Text2'..text..msg.chat_id)
Redis:del(itsspider..'spider1:Add:Rd:Sudo:Text3'..text..msg.chat_id)
Redis:del(itsspider..'spider1:Add:Rd:Sudo:Text4'..text..msg.chat_id)
Redis:del(itsspider.."spider1:Set:On"..msg.sender.user_id..":"..msg.chat_id)
Redis:srem(itsspider.."spider1:List:Rd:Sudo"..msg.chat_id, text)
return  LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حذف الرد من ردود المتعدده") end end
if text == "اضف رد متعدد" then    
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closerdManagers'},},}}
Redis:set(itsspider.."spider1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل الكلمة التي تريد اضافتها", "md", false, false, false, false, reply_markup) end
if text == "حذف رد متعدد" then    
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closedeleterd'},},}}
Redis:set(itsspider.."spider1:Set:On"..msg.sender.user_id..":"..msg.chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل الان الكلمه لحذفها ", "md", false, false, false, false, reply_markup) end
if text then  
local test = Redis:get(itsspider.."spider1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(itsspider.."spider1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true1" then
Redis:set(itsspider.."spider1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd1')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(itsspider.."spider1:Add:Rd:Sudo:Text"..test..msg.chat_id, text)  end  
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ انهاء وحفظ 1 من الردود ›', data = msg.sender.user_id..'/closerdcl'},},{{text = '‹ الغاء وحذف التخزين ›', data = msg.sender.user_id..'/closerddel'},},
}}
LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حفظ الرد رقم ↫ ‹ 1 ›\n⌁ : الان ارسل الرد رقم ↫ ‹ 2 ›", "md", false, false, false, false, reply_markup)
return false  
end  
end
if text then  
local test = Redis:get(itsspider.."spider1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(itsspider.."spider1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd1" then
Redis:set(itsspider.."spider1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd2')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(itsspider.."spider1:Add:Rd:Sudo:Text1"..test..msg.chat_id, text)  end  
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ انهاء وحفظ 2 من الردود ›', data = msg.sender.user_id..'/closerdcl'},},{{text = '‹ الغاء وحذف التخزين ›', data = msg.sender.user_id..'/closerddel'},},
}}
LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حفظ الرد رقم ↫ ‹ 2 ›\n⌁ : الان ارسل الرد رقم ↫ ‹ 3 ›", "md", false, false, false, false, reply_markup)
return false  
end  
end
if text then  
local test = Redis:get(itsspider.."spider1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(itsspider.."spider1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd2" then
Redis:set(itsspider.."spider1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd3')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(itsspider.."spider1:Add:Rd:Sudo:Text2"..test..msg.chat_id, text)  end  
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ انهاء وحفظ 3 من الردود ›', data = msg.sender.user_id..'/closerdcl'},},{{text = '‹ الغاء وحذف التخزين ›', data = msg.sender.user_id..'/closerddel'},},
}}
LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حفظ الرد رقم ↫ ‹ 3 ›\n⌁ : الان ارسل الرد رقم ↫ ‹ 4 ›", "md", false, false, false, false, reply_markup)
return false  
end  
end
if text then  
local test = Redis:get(itsspider.."spider1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(itsspider.."spider1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd3" then
Redis:set(itsspider.."spider1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd4')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(itsspider.."spider1:Add:Rd:Sudo:Text3"..test..msg.chat_id, text)  end  
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ انهاء وحفظ 4 من الردود ›', data = msg.sender.user_id..'/closerdcl'},},{{text = '‹ الغاء وحذف التخزين ›', data = msg.sender.user_id..'/closerddel'},},
}}
LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حفظ الرد رقم ↫ ‹ 2 ›\n⌁ : الان ارسل الرد رقم ↫ ‹ 3 ›", "md", false, false, false, false, reply_markup)
return false  
end  
end
if text then  
local test = Redis:get(itsspider.."spider1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(itsspider.."spider1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd4" then
Redis:set(itsspider.."spider1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd5')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(itsspider.."spider1:Add:Rd:Sudo:Text4"..test..msg.chat_id, text)  end  
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = 'حذف الرد ↫ ‹ '..test..' ›', data = msg.sender.user_id..'/delrdOR33R'},},}}
LuaTele.sendText(msg_chat_id,msg_id,'⌁ : تم حفظ ‹ 5 › من الردود للكلمة ↫ ‹ '..test..' ›', "md", false, false, false, false, reply_markup)
return false  
end  
end
if text then
local Text = Redis:get(itsspider.."spider1:Add:Rd:Sudo:Text"..text..msg.chat_id)   
local Text1 = Redis:get(itsspider.."spider1:Add:Rd:Sudo:Text1"..text..msg.chat_id)   
local Text2 = Redis:get(itsspider.."spider1:Add:Rd:Sudo:Text2"..text..msg.chat_id)   
local Text3 = Redis:get(itsspider.."spider1:Add:Rd:Sudo:Text3"..text..msg.chat_id)   
local Text4 = Redis:get(itsspider.."spider1:Add:Rd:Sudo:Text4"..text..msg.chat_id)   
if Text or Text1 or Text2 or Text3 or Text4 then 
local texting = {
Text,
Text1,
Text2,
Text3,
Text4
}
Textes = math.random(#texting)
 LuaTele.sendText(msg_chat_id,msg_id,texting[Textes]) end end
-- OR33
if text and text:match("^(.*)$") then
if Redis:get(itsspider.."spider11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true" then
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closerd0bot'},},}}
LuaTele.sendText(msg_chat_id,msg_id, '\n⌁ : تم حفظ الكلمة \n⌁ : الان ارسل الرد رقم ↫ ‹ 1 ›', "md", false, false, false, false, reply_markup)
Redis:set(itsspider.."spider11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id, "true1")
Redis:set(itsspider.."spider11:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id, text)
Redis:sadd(itsspider.."spider11:List:Rd:Sudo", text)
return false end end
if text and text:match("^(.*)$") then
if Redis:get(itsspider.."spider11:Set:On"..msg.sender.user_id..":"..msg.chat_id) == "true" then
 LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حذف الرد من ردود المتعدده")
Redis:del(itsspider..'spider11:Add:Rd:Sudo:Text'..text)
Redis:del(itsspider..'spider11:Add:Rd:Sudo:Text1'..text)
Redis:del(itsspider..'spider11:Add:Rd:Sudo:Text2'..text)
Redis:del(itsspider.."spider11:Set:On"..msg.sender.user_id..":"..msg.chat_id)
Redis:srem(itsspider.."spider11:List:Rd:Sudo", text)
return false end end
if text == "اضف رد متعدد عام" then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closerdControllerBot'},},}}
Redis:set(itsspider.."spider11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"ارسل الرد الذي اريد اضافته", "md", false, false, false, false, reply_markup) end
if text == "حذف رد متعدد عام" then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closedeleterdbot'},},}}
Redis:set(itsspider.."spider11:Set:On"..msg.sender.user_id..":"..msg.chat_id,true)
return  LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل الان الكلمه لحذفها ", "md", false, false, false, false, reply_markup) end
if text then  
local test = Redis:get(itsspider.."spider11:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(itsspider.."spider11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true1" then
Redis:set(itsspider.."spider11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd1')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(itsspider.."spider11:Add:Rd:Sudo:Text"..test, text)  end  
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ انهاء وحفظ 1 من الردود ›', data = msg.sender.user_id..'/closerdclbot'},},{{text = '‹ الغاء وحذف التخزين ›', data = msg.sender.user_id..'/closerddelbot'},},
}}
 LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حفظ الرد رقم ↫ ‹ 1 ›\n⌁ : الان ارسل الرد رقم ↫ ‹ 2 ›", "md", false, false, false, false, reply_markup)
return false  
end  
end
if text then  
local test = Redis:get(itsspider.."spider11:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(itsspider.."spider11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd1" then
Redis:set(itsspider.."spider11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd2')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(itsspider.."spider11:Add:Rd:Sudo:Text1"..test, text)  end  
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ انهاء وحفظ 2 من الردود ›', data = msg.sender.user_id..'/closerdclbot'},},{{text = '‹ الغاء وحذف التخزين ›', data = msg.sender.user_id..'/closerddelbot'},},
}}
 LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حفظ الرد رقم ↫ ‹ 2 ›\n⌁ : الان ارسل الرد رقم ↫ ‹ 3 ›", "md", false, false, false, false, reply_markup)
return false  
end  
end
if text then  
local test = Redis:get(itsspider.."spider11:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(itsspider.."spider11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd2" then
Redis:set(itsspider.."spider11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd3')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(itsspider.."spider11:Add:Rd:Sudo:Text2"..test, text)  end  
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = 'حذف الرد ↫ ‹ '..test..' ›', data = msg.sender.user_id..'/delrdOR33Rbot'},},}}
 LuaTele.sendText(msg_chat_id,msg_id,'⌁ : تم حفظ ‹ 3 › من الردود للكلمة ↫ ‹ '..test..' ›', "md", false, false, false, false, reply_markup)
return false  
end  
end
if text then
local Text = Redis:get(itsspider.."spider11:Add:Rd:Sudo:Text"..text)   
local Text1 = Redis:get(itsspider.."spider11:Add:Rd:Sudo:Text1"..text)   
local Text2 = Redis:get(itsspider.."spider11:Add:Rd:Sudo:Text2"..text)   
if Text or Text1 or Text2 then 
local texting = {
Text,
Text1,
Text2
}
Textes = math.random(#texting)
 LuaTele.sendText(msg_chat_id,msg_id,texting[Textes]) end end
-- OR33
if text == "تنظيف الميديا" or text == "مسح الميديا" then
LuaTele.sendText(msg.chat_id,msg.id,"*⌔︙يتم البحث عن الميديا*","md",true)  
msgid = (msg.id - (1048576*250))
y = 0
r = 1048576
for i=1,250 do
r = r + 1048576
Delmsg = LuaTele.getMessage(msg.chat_id,msgid + r)
if Delmsg and Delmsg.content and Delmsg.content.luatele ~= "messageText" then
LuaTele.deleteMessages(msg.chat_id,{[1]= Delmsg.id}) 
y = y + 1
end
end
if y == 0 then 
t = "*⌔︙لم يتم العثور على ميديا ضمن 250 رساله السابقه*"
else
t = "*⌔︙تم حذف ( "..y.." ) من الميديا *"
end
return LuaTele.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender.user_id,t).Repbn,"md",true)  
end
-- OR33
if text and text:match("^عدد المسح (%d+)$") and msg.Cleaner then
local NumMessage = text:match("^عدد المسح (%d+)$")
if tonumber(NumMessage) > 1000 then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : يجب ان يكون العدد اقل من ‹* 1000 *›',"md",true)  end
if tonumber(NumMessage) < 10 then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : يجب ان يكون العدد اكثر من ‹* 10 *›',"md",true)  end
Redis:set(itsspider..'spider:Num:Add:Bot'..msg_chat_id,text:match("عدد المسح (%d+)$") ) 
LuaTele.sendText(msg_chat_id,msg_id,'⌁ : تم تعيين عدد المسح الى ↫ ‹ *'..text:match("عدد المسح (%d+)$")..'* › ',"md",true)  end
--
if text == "عدد المسح" and msg.Cleaner then
LuaTele.sendText(msg_chat_id,msg_id,'⌁ : عدد المسح الحالي ↫ ‹ *'..(Redis:get(itsspider..'spider:Num:Add:Bot'..msg_chat_id) or 150)..'* › ',"md",true)  end
-- 
if msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo or msg.content.video_sticker then      
Redis:sadd(itsspider.."spider:allM"..msg.chat_id, msg.id)
if Redis:get(itsspider.."spider:Status:Del:Media"..msg.chat_id) then    
local gmedia = Redis:scard(itsspider.."spider:allM"..msg.chat_id)  
if gmedia >= tonumber((Redis:get(itsspider..'spider:Num:Add:Bot'..msg_chat_id) or 150)) then
local liste = Redis:smembers(itsspider.."spider:allM"..msg.chat_id)
for k,v in pairs(liste) do
local Mesge = v
if Mesge then
t = "⌁ : تم مسح ‹ "..k.." › من الوسائط تلقائيا\n⌁ : لتعطيل الميزه ارسل ( `تعطيل التلقائي` )"
LuaTele.deleteMessages(msg.chat_id,{[1]= Mesge}) end end
LuaTele.sendText(msg_chat_id,msg_id,t,"md",true) 
Redis:del(itsspider.."spider:allM"..msg.chat_id) end end
end
if text == ("امسح") and msg.Cleaner then  
local list = Redis:smembers(itsspider.."spider:allM"..msg.chat_id)
for k,v in pairs(list) do
local Message = v
if Message then
t = "⌁ : تم حذف ‹ "..k.." › من الميديا"
LuaTele.deleteMessages(msg.chat_id,{[1]= Message})
Redis:del(itsspider.."spider:allM"..msg.chat_id) end end
if #list == 0 then
t = "⌁ : لا توجد ميديا في المجموعة"
end
 LuaTele.sendText(msg_chat_id,msg_id, t) end
if text == "عدد الميديا" and msg.Cleaner or text == "الميديا" and msg.Cleaner then  
local gmria = Redis:scard(itsspider.."spider:allM"..msg.chat_id)  
if gmria == 0 then
LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : عدد الميديا ↫ *‹* "..gmria.." *›","md")
else
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ امسح ›', data = msg.sender.user_id..'/MsHOR33'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : عدد الميديا ↫ *‹* "..gmria.." *›","md",false, false ,false, false, reply_markup) end end
if text == "تعطيل المسح التلقائي" and msg.Cleaner or text == "تعطيل التلقائي" and msg.Cleaner then
Redis:del(itsspider.."spider:Status:Del:Media"..msg.chat_id)
 LuaTele.sendText(msg_chat_id,msg_id,'⌁ : تم تعطيل المسح التلقائي للميديا')
return false end 
if text == "تفعيل المسح التلقائي" and msg.Cleaner or text == "تفعيل التلقائي" and msg.Cleaner then
Redis:set(itsspider.."spider:Status:Del:Media"..msg.chat_id,true)
LuaTele.sendText(msg_chat_id,msg_id,'⌁ : تم تفعيل المسح التلقائي للميديا')
return false end 
if text and text:match("^تعطيل (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^تعطيل (.*)$")
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if TextMsg == 'اوامر التسليه' then
Redis:del(itsspider.."spider:Status:distraction10"..msg_chat_id,true) 
Redis:del(itsspider.."spider:Status:distraction9"..msg_chat_id,true) 
Redis:del(itsspider.."spider:Status:distraction8"..msg_chat_id,true) 
Redis:del(itsspider.."spider:Status:distraction7"..msg_chat_id,true) 
Redis:del(itsspider.."spider:Status:distraction6"..msg_chat_id,true) 
Redis:del(itsspider.."spider:Status:distraction5"..msg_chat_id,true) 
Redis:del(itsspider.."spider:Status:distraction4"..msg_chat_id,true) 
Redis:del(itsspider.."spider:Status:distraction3"..msg_chat_id,true) 
Redis:del(itsspider.."spider:Status:distraction2"..msg_chat_id,true) 
Redis:del(itsspider.."spider:Status:distraction1"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل اوامر التسليه *").unLock,"md",true) end
if TextMsg == 'غنيلي' then
Redis:del(itsspider.."spider:Status:distraction1"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل امر غنيلي *").unLock,"md",true) end
if TextMsg == 'متحركه' then
Redis:del(itsspider.."spider:Status:distraction2"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل امر متحركه *").unLock,"md",true) end
if TextMsg == 'شعر' then
Redis:del(itsspider.."spider:Status:distraction3"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل امر شعر *").unLock,"md",true) end
if TextMsg == 'فلم' then
Redis:del(itsspider.."spider:Status:distraction4"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل امر شعر *").unLock,"md",true) end
if TextMsg == 'صوره' then
Redis:del(itsspider.."spider:Status:distraction5"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل امر صوره *").unLock,"md",true) end
if TextMsg == 'اغنيه' then
Redis:del(itsspider.."spider:Status:distraction6"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل امر اغنيه *").unLock,"md",true) end
if TextMsg == 'انمي' then
Redis:del(itsspider.."spider:Status:distraction7"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل امر انمي *").unLock,"md",true) end
if TextMsg == 'ريمكس' then
Redis:del(itsspider.."spider:Status:distraction8"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل امر ريمكس *").unLock,"md",true) end
if TextMsg == 'ميمز' then
Redis:del(itsspider.."spider:Status:distraction9"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل امر ميمز *").unLock,"md",true) end
if TextMsg == 'مسلسل' then
Redis:del(itsspider.."spider:Status:distraction10"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل امر مسلسل *").unLock,"md",true) end
if TextMsg == 'الرابط' then
Redis:del(itsspider.."spider:Status:Link"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل الرابط *").unLock,"md",true) end
if TextMsg == 'الترحيب' then
Redis:del(itsspider.."spider:Status:Welcome"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل الترحيب *").unLock,"md",true) end
if TextMsg == 'الايدي' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Status:Id"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل الايدي *").unLock,"md",true) end
if TextMsg == 'الايدي بالصوره' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Status:IdPhoto"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل الايدي بالصورة *").unLock,"md",true) end
if TextMsg == 'ردود المدير' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Status:Reply"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل ردود المدير *").unLock,"md",true) end
if TextMsg == 'ردود المطور' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Status:ReplySudo"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل ردود المطور *").unLock,"md",true) end
if TextMsg == 'الحظر' or TextMsg == 'الطرد' or TextMsg == 'التقييد' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Status:BanId"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل الحظر , الطرد , التقييد *").unLock,"md",true) end
if TextMsg == 'الرفع' then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Status:SetId"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل الرفع *").unLock,"md",true) end
if TextMsg == 'الالعاب' then
Redis:del(itsspider.."spider:Status:Games"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل الالعاب *").unLock,"md",true) end
if TextMsg == 'اطردني' then
Redis:del(itsspider.."spider:Status:KickMe"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل اطردني *").unLock,"md",true) end
if TextMsg == 'صورتي' then
Redis:del(itsspider.."spider:Status:photo"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل امر صورتي *").unLock,"md",true) end
if TextMsg == 'كول' then
Redis:del(itsspider.."spider:Status:kool"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل امر كول *").unLock,"md",true) end
if TextMsg == 'جمالي' then
Redis:del(itsspider.."spider:Status:gamle"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل جمالي *").unLock,"md",true) end
if TextMsg == 'ردود السورس' then
Redis:del(itsspider.."spider:rb:bna"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ :  تم تعطيل ردود السورس","md",true)
end
if TextMsg == 'نزلني' then
Redis:del(itsspider.."spider:Status:remMe"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل نزلني *").unLock,"md",true) end
if TextMsg == 'البوت الخدمي' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:BotFree") 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل البوت الخدمي *").unLock,"md",true) end
if TextMsg == 'التواصل' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:TwaslBot") 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم تعطيل التواصل داخل البوت*").unLock,"md",true) end

end
if text and text:match('^حظر عام @(%S+)$') then
local UserName = text:match('^حظر عام @(%S+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if Controllerbanall(msg_chat_id,UserId_Info.id) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع حظر ↫ ‹ "..Controller(msg_chat_id,UserId_Info.id).." › ","md",true)  end
if Redis:sismember(itsspider.."spider:BanAll:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم حظره عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:BanAll:Groups",UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم حظره عام من المجموعات ").Reply,"md",true) end end
if text and text:match('^الغاء حظر عام (%d+)$') then
local UserId = text:match('^الغاء حظر عام (%d+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if not Redis:sismember(itsspider.."spider:BanAll:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم الغاء حظره عام من المجموعات بالتأكيد").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:BanAll:Groups",UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم الغاء حظره عام من المجموعات").Reply,"md",true) end end
if text and text:match('^الغاء حظر عام @(%S+)$') then
local UserName = text:match('^الغاء حظر عام @(%S+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if not Redis:sismember(itsspider.."spider:BanAll:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم الغاء حظره عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:BanAll:Groups",UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم الغاء حظره عام من المجموعات ").Reply,"md",true) end end
if text and text:match('^كتم عام @(%S+)$') then
local UserName = text:match('^كتم عام @(%S+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام معرف البوت ","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'المطور الاساسي' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'المطور الاساسي' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'المطور الاساسي²' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'مبرمج السورس' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'مبرمج السورس' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'مبرمج السورس' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Redis:sismember(itsspider.."spider:ktmAll:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم كتمه عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:ktmAll:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم كتمه عام من المجموعات ").Reply,"md",true) end end
if text and text:match('^الغاء كتم عام (%d+)$') then
local UserId = text:match('^الغاء كتم عام (%d+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if not Redis:sismember(itsspider.."spider:ktmAll:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم الغاء كتمه عام من المجموعات بالتأكيد").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:ktmAll:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم الغاء كتمه عام من المجموعات").Reply,"md",true) end end
if text and text:match('^الغاء كتم عام @(%S+)$') then
local UserName = text:match('^الغاء كتم عام @(%S+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام معرف البوت ","md",true)  end
if not Redis:sismember(itsspider.."spider:ktmAll:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم الغاء كتمه عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:ktmAll:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم الغاء كتمه عام من المجموعات  ").Reply,"md",true) end end
if text and text:match('^حظر @(%S+)$') then
local UserName = text:match('^حظر @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(itsspider.."spider:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع حظر ↫ ‹ "..Controller(msg_chat_id,UserId_Info.id).." › ","md",true)  end
if Redis:sismember(itsspider.."spider:BanGroup:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم حظره من المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:BanGroup:Group"..msg_chat_id,UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم حظره من المجموعة ").Reply,"md",true) end end
if text and text:match('^الغاء حظر @(%S+)$') then
local UserName = text:match('^الغاء حظر @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if not Redis:sismember(itsspider.."spider:BanGroup:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم الغاء حظره من المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:BanGroup:Group"..msg_chat_id,UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم الغاء حظره من المجموعة  ").Reply,"md",true) end end
if text and text:match('^كتم @(%S+)$') then
local UserName = text:match('^كتم @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if GetInfoBot(msg).Delmsg == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if StatusSilent(msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً لا تستطيع كتم ↫ ‹ "..Controller(msg_chat_id,UserId_Info.id).." › *","md",true)  end
if Redis:sismember(itsspider.."spider:SilentGroup:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم كتمه في المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم كتمه في المجموعة  ").Reply,"md",true) end end
if text and text:match('^الغاء كتم @(%S+)$') then
local UserName = text:match('^الغاء كتم @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if not Redis:sismember(itsspider.."spider:SilentGroup:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم الغاء كتمه من المجموعة ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم الغاء كتمه من المجموعة ").Reply,"md",true) end end
if text and text:match('^تقييد (%d+) (.*) @(%S+)$') then
local UserName = {text:match('^تقييد (%d+) (.*) @(%S+)$')}
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(itsspider.."spider:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local UserId_Info = LuaTele.searchPublicChat(UserName[3])
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName[3] and UserName[3]:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع تقييد ↫ ‹ "..Controller(msg_chat_id,UserId_Info.id).." › ","md",true)  end
if UserName[2] == 'يوم' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if UserName[2] == 'ساعه' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if UserName[2] == 'دقيقه' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 60
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time)})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم تقييده في المجموعة \n⌁ : لمدة : "..UserName[1]..' '..UserName[2]).Reply,"md",true)  end
if text and text:match('^تقييد (%d+) (.*)$') and msg.reply_to_message_id ~= 0 then
local TimeKed = {text:match('^تقييد (%d+) (.*)$')}
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(itsspider.."spider:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع تقييد ↫ ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." › ","md",true)  end
if TimeKed[2] == 'يوم' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TimeKed[2] == 'ساعه' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TimeKed[2] == 'دقيقه' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 60
end
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time)})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تقييده في المجموعة \n⌁ : لمدة : "..TimeKed[1]..' '..TimeKed[2]).Reply,"md",true)  end
if text and text:match('^تقييد (%d+) (.*) (%d+)$') then
local UserId = {text:match('^تقييد (%d+) (.*) (%d+)$')}
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(itsspider.."spider:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local UserInfo = LuaTele.getUser(UserId[3])
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,UserId[3]) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع تقييد ↫ ‹ "..Controller(msg_chat_id,UserId[3]).." › ","md",true)  end
if UserId[2] == 'يوم' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if UserId[2] == 'ساعه' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if UserId[2] == 'دقيقه' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 60
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId[3],'restricted',{1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time)})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[3],"\n⌁ : تم تقييده في المجموعة \n⌁ : لمدة : "..UserId[1]..' ' ..UserId[2]).Reply,"md",true)  end
if text and text:match('^تقييد @(%S+)$') then
local UserName = text:match('^تقييد @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if not msg.Originators and not Redis:get(itsspider.."spider:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع تقييد ↫ ‹ "..Controller(msg_chat_id,UserId_Info.id).." › ","md",true)  end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,0,0,0,0,0,0,0,0})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم تقييده في المجموعة ").Reply,"md",true)  end
if text and text:match('^الغاء التقييد @(%S+)$') then
local UserName = text:match('^الغاء التقييد @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم الغاء تقييده من المجموعة").Reply,"md",true)  end
if text and text:match('^طرد @(%S+)$') then
local UserName = text:match('^طرد @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(itsspider.."spider:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع طرد ↫ ‹ "..Controller(msg_chat_id,UserId_Info.id).." › ","md",true)  end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم طرده من المجموعة ").Reply,"md",true)  end
if text == ('حظر عام') and msg.reply_to_message_id ~= 0 then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if Controllerbanall(msg_chat_id,Message_Reply.sender.user_id) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع حظر ↫ ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." › ","md",true)  end
if Redis:sismember(itsspider.."spider:BanAll:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم حظره عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:BanAll:Groups",Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم حظره عام من المجموعات ").Reply,"md",true) end end
if text == "الغاء العام" and msg.reply_to_message_id ~= 0 then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if not Redis:sismember(itsspider.."spider:BanAll:Groups",Message_Reply.sender.user_id) and not Redis:sismember(itsspider.."spider:ktmAll:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم الغاء ( الحظر • الكتم ) العام عنه بالتأكيد").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:BanAll:Groups",Message_Reply.sender.user_id) 
Redis:srem(itsspider.."spider:ktmAll:Groups",Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم الغاء ( الحظر • الكتم ) العام عنه").Reply,"md",true) end end
if text == "الغاء حظر عام" and msg.reply_to_message_id ~= 0 or text == "الغاء الحظر عام" and msg.reply_to_message_id ~= 0 then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if not Redis:sismember(itsspider.."spider:BanAll:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم الغاء حظره عام من المجموعات بالتأكيد").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:BanAll:Groups",Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم الغاء حظره عام من المجموعات").Reply,"md",true) end end
if text == ('كتم عام') and msg.reply_to_message_id ~= 0 then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local ban = LuaTele.getUser(Message_Reply.sender.user_id)
if ban.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if ban and ban.type and ban.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام الامر على البوت ","md",true)  end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'المطور الاساسي' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." ›*","md",true)  end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'المطور الاساسي²' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." ›*","md",true)  end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'مبرمج السورس' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." ›*","md",true)  end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'مبرمج السورس' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." ›*","md",true)  end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'مبرمج السورس' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." ›*","md",true)  end
if Redis:sismember(itsspider.."spider:ktmAll:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم كتمه عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:ktmAll:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم كتمه عام من المجموعات ").Reply,"md",true) end end
if text == "الغاء الكتم العام" and msg.reply_to_message_id ~= 0 or text == "الغاء الكتم عام" and msg.reply_to_message_id ~= 0 or text == "الغاء كتم عام" and msg.reply_to_message_id ~= 0 then
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local ban = LuaTele.getUser(Message_Reply.sender.user_id)
if ban.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if ban and ban.type and ban.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام الامر على البوت ","md",true)  end
if not Redis:sismember(itsspider.."spider:ktmAll:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم الغاء كتمه عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:ktmAll:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم الغاء كتمه عام من المجموعات  ").Reply,"md",true) end end
if text == ('حظر') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(itsspider.."spider:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع حظر ↫ ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." › ","md",true)  end
if Redis:sismember(itsspider.."spider:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم حظره من المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم حظره من المجموعة ").Reply,"md",true) end end
if text == ('الغاء حظر') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if not Redis:sismember(itsspider.."spider:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم الغاء حظره من المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم الغاء حظره من المجموعة  ").Reply,"md",true) end end
if text == ('كتم') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if GetInfoBot(msg).Delmsg == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if StatusSilent(msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً لا تستطيع كتم ↫ ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." › *","md",true)  end
if Redis:sismember(itsspider.."spider:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم كتمه في المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم كتمه في المجموعة  ").Reply,"md",true) end end
if text == ('الغاء كتم') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if not Redis:sismember(itsspider.."spider:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم الغاء كتمه من المجموعة ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم الغاء كتمه من المجموعة ").Reply,"md",true) end end
if text == ('تقييد') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(itsspider.."spider:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً لا تستطيع  ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." › *","md",true)  end
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تقييده في المجموعة ").Reply,"md",true)  end
if text == ('الغاء التقييد') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم الغاء تقييده من المجموعة").Reply,"md",true)  end
if text == ('طرد') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(itsspider.."spider:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع طرد ↫ ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." › ","md",true)  end
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم طرده من المجموعة ").Reply,"md",true)  end
if text and text:match('^حظر عام (%d+)$') then
local UserId = text:match('^حظر عام (%d+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if Controllerbanall(msg_chat_id,UserId) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع حظر ↫ ‹ "..Controller(msg_chat_id,UserId).." › ","md",true)  end
if Redis:sismember(itsspider.."spider:BanAll:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم حظره عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:BanAll:Groups",UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم حظره عام من المجموعات ").Reply,"md",true) end end
if text and text:match('^كتم عام (%d+)$') then
local UserId = text:match('^كتم عام (%d+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if Controllerbanall(msg_chat_id,UserId) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع كتم ↫ ‹ "..Controller(msg_chat_id,UserId).." › ","md",true)  end
if Redis:sismember(itsspider.."spider:ktmAll:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم كتمه عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:ktmAll:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم كتمه عام من المجموعات ").Reply,"md",true) end end
if text and text:match('^الغاء العام (%d+)$') then
local UserId = text:match('^الغاء العام (%d+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if not Redis:sismember(itsspider.."spider:BanAll:Groups",UserId) and not Redis:sismember(itsspider.."spider:ktmAll:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم الغاء ( الحظر • الكتم ) العام عنه بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:BanAll:Groups",UserId) 
Redis:srem(itsspider.."spider:ktmAll:Groups",UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم الغاء ( الحظر • الكتم ) العام عنه").Reply,"md",true) end end
if text and text:match('^الغاء العام @(%S+)$') then
local UserName = text:match('^الغاء العام @(%S+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if not Redis:sismember(itsspider.."spider:BanAll:Groups",UserId_Info.id) and not Redis:sismember(itsspider.."spider:ktmAll:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم الغاء ( الحظر • الكتم ) العام عنه بالتأكيد").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:BanAll:Groups",UserId_Info.id) 
Redis:srem(itsspider.."spider:ktmAll:Groups",UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم الغاء ( الحظر • الكتم ) العام عنه").Reply,"md",true) end end
if text and text:match('^حظر (%d+)$') then
local UserId = text:match('^حظر (%d+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(itsspider.."spider:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,UserId) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع حظر ↫ ‹ "..Controller(msg_chat_id,UserId).." › ","md",true)  end
if Redis:sismember(itsspider.."spider:BanGroup:Group"..msg_chat_id,UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم حظره من المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:BanGroup:Group"..msg_chat_id,UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم حظره من المجموعة ").Reply,"md",true) end end
if text and text:match('^الغاء حظر (%d+)$') then
local UserId = text:match('^الغاء حظر (%d+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if not Redis:sismember(itsspider.."spider:BanGroup:Group"..msg_chat_id,UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم الغاء حظره من المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:BanGroup:Group"..msg_chat_id,UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم الغاء حظره من المجموعة  ").Reply,"md",true) end end
if text and text:match('^كتم (%d+)$') then
local UserId = text:match('^كتم (%d+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if GetInfoBot(msg).Delmsg == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if StatusSilent(msg_chat_id,UserId) then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً لا تستطيع كتم ↫ ‹ "..Controller(msg_chat_id,UserId).." › *","md",true)  end
if Redis:sismember(itsspider.."spider:SilentGroup:Group"..msg_chat_id,UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم كتمه في المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:SilentGroup:Group"..msg_chat_id,UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم كتمه في المجموعة  ").Reply,"md",true) end end
if text and text:match('^الغاء كتم (%d+)$') then
local UserId = text:match('^الغاء كتم (%d+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if not Redis:sismember(itsspider.."spider:SilentGroup:Group"..msg_chat_id,UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم الغاء كتمه من المجموعة ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:SilentGroup:Group"..msg_chat_id,UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم الغاء كتمه من المجموعة ").Reply,"md",true) end end
if text and text:match('^تقييد (%d+)$') then
local UserId = text:match('^تقييد (%d+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(itsspider.."spider:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,UserId) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع تقييد ↫ ‹ "..Controller(msg_chat_id,UserId).." › ","md",true)  end
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,0,0,0,0,0,0,0,0})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم تقييده في المجموعة ").Reply,"md",true)  end
if text and text:match('^الغاء التقييد (%d+)$') then
local UserId = text:match('^الغاء التقييد (%d+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم الغاء تقييده من المجموعة").Reply,"md",true)  end
if text and text:match('^طرد (%d+)$') then
local UserId = text:match('^طرد (%d+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(itsspider.."spider:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,UserId) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع طرد ↫ ‹ "..Controller(msg_chat_id,UserId).." › ","md",true)  end
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم طرده من المجموعة ").Reply,"md",true)  end
if text == 'ادمنيه الكروب' or text == 'ادمنية الكروب' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
listAdmin = '\n*⌁ : قائمة الادمنيه المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Creator = '↬ *‹ المالك ›*'
else
Creator = ""
end
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
listAdmin = listAdmin.."*"..k.." - @"..UserInfo.username.."* "..Creator.."\n"
else
listAdmin = listAdmin.."*"..k.." - *["..UserInfo.id.."](tg://user?id="..UserInfo.id..") "..Creator.."\n" end end
LuaTele.sendText(msg_chat_id,msg_id,listAdmin,"md",true)  end
if text == 'رفع الادمنيه' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(itsspider.."spider:TheBasics:Group"..msg_chat_id,v.member_id.user_id) 
x = x + 1
else
Redis:sadd(itsspider.."spider:Addictive:Group"..msg_chat_id,v.member_id.user_id) 
y = y + 1 end end
end
LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : تم ترقيه ‹ '..y..' › من الادمنيه *',"md",true)  end
if text == 'المالك' or text == 'المنشئ' then
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*•︙︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(itsspider..'spider:Channel:Join:Name')..'', url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n•︙عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.first_name == "" then
LuaTele.sendText(msg_chat_id,msg_id,"*•︙︙اوبس , المالك حسابه محذوف *","md",true)  
return false
end 
local photo = LuaTele.getUserProfilePhotos(UserInfo.id)
local InfoUser = LuaTele.getUserFullInfo(UserInfo.id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
if photo.total_count > 0 then
local TestText = "  ❲ Owner Groups ❳\n— — — — — — — — —\n •︙*Owner Name* :  ["..UserInfo.first_name.."](tg://user?id="..UserInfo.id..")\n•︙*Owner Bio* : [❲ "..Bio.." ❳]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = "❲"..UserInfo.first_name.."❳", url = "https://t.me/"..UserInfo.username..""}
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else

local TestText = "- معلومات المالك : \n\n- ["..UserInfo.first_name.."](tg://user?id="..UserInfo.id..")\n \n ["..Bio.."]"
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown")
end
end
end
end
if text == 'كشف البوتات' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
listBots = '\n*⌁ : قائمة البوتات ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
x = 0
for k, v in pairs(List_Members) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if Info_Members.members[k].status.luatele == "chatMemberStatusAdministrator" then
x = x + 1
Admin = '↬ *‹ ادمن ›*'
else
Admin = ""
end
listBots = listBots.."*"..k.." - @"..UserInfo.username.."* "..Admin.."\n"
end
LuaTele.sendText(msg_chat_id,msg_id,listBots.."*\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n⌁ : عدد البوتات التي هي ادمن ‹ "..x.." ›*","md",true)  end
if text == 'المقيدين' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Recent", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = nil
restricted = '\n*⌁ : قائمة المقيديين ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.luatele == "chatMemberStatusRestricted" then
y = true
x = x + 1
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
restricted = restricted.."*"..x.." - @"..UserInfo.username.."*\n"
else
restricted = restricted.."*"..x.." - *["..UserInfo.id.."](tg://user?id="..UserInfo.id..") \n" end end
end
if y == true then
LuaTele.sendText(msg_chat_id,msg_id,restricted,"md",true) end end
if text == 'تاك للكل' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
listall = '\n*⌁ : قائمة الاعضاء ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(List_Members) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
listall = listall.."*"..k.." - @"..UserInfo.username.."*\n"
else
listall = listall.."*"..k.." -* ["..UserInfo.id.."](tg://user?id="..UserInfo.id..")\n" end end
LuaTele.sendText(msg_chat_id,msg_id,listall,"md",true)  end
if text == "قفل الفشار" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Fshar"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الفشار في المجموعة").Lock,"md",true)  
return false end 
if text == "قفل الطائفيه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Taf"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الطائفيه في المجموعة").Lock,"md",true)  
return false end 
if text == "قفل الكفر" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Kfr"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الكفر في المجموعة").Lock,"md",true)  
return false end 
if text == "قفل الفارسيه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Farsi"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الفارسيه في المجموعة").Lock,"md",true)  
return false end 
if text == "قفل الانكليزيه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:F1arsi"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الانكليزيه في المجموعة").Lock,"md",true)  
return false end 
if text == "قفل الدردشه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:text"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الدردشه").Lock,"md",true)  
return false end 
if text == "قفل الاضافه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:set(itsspider.."spider:Lock:AddMempar"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل اضافة الاعضاء").Lock,"md",true)  
return false end 
if text == "قفل الدخول" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:set(itsspider.."spider:Lock:Join"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل دخول الاعضاء").Lock,"md",true)  
return false end 
if text == "قفل البوتات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:set(itsspider.."spider:Lock:Bot:kick"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل البوتات").Lock,"md",true)  
return false end 
if text == "قفل البوتات بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:set(itsspider.."spider:Lock:Bot:kick"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل البوتات").lockKick,"md",true)  
return false end 
if text == "قفل الاشعارات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end  
Redis:set(itsspider.."spider:Lock:tagservr"..msg_chat_id,true)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الاشعارات").Lock,"md",true)  
return false end 
if text == "قفل التثبيت" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end  
Redis:set(itsspider.."spider:lockpin"..msg_chat_id,(LuaTele.getChatPinnedMessage(msg_chat_id).id or true)) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل التثبيت هنا").Lock,"md",true)  
return false end 
if text == "قفل التعديل" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:set(itsspider.."spider:Lock:edit"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل تعديل").Lock,"md",true)  
return false end 
if text == "قفل تعديل الميديا" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:set(itsspider.."spider:Lock:edit"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل تعديل").Lock,"md",true)  
return false end 
if text == "قفل الكل" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end  
Redis:set(itsspider.."spider:Lock:tagservrbot"..msg_chat_id,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:set(itsspider..'spider:'..lock..msg_chat_id,"del")    
end
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل جميع الاوامر").Lock,"md",true)  
return false end 


--------------------------------------------------------------------------------------------------------------
if text == 'هاي' or text == 'هيي' then
return LuaTele.sendText(msg_chat_id,msg_id,'*خالتڪك جࢪت وࢪانا 😹💕*',"md",true)  
end
if text == 'سلام عليكم' or text == 'السلام' then

return LuaTele.sendText(msg_chat_id,msg_id,'*وعلڪم السلام 💕*',"md",true)  
end
if text == 'باي' or text == 'سيو' then
return LuaTele.sendText(msg_chat_id,msg_id,'*وين خليڪك ويانۿہ 💘*',"md",true)  
end
if text == 'تحبني' or text == 'تحبيني' then
return LuaTele.sendText(msg_chat_id,msg_id,'*اموت عليڪك يࢪوحي 🥺💘*',"md",true)  
end
if text == 'ها' or text == 'هاا' then
return LuaTele.sendText(msg_chat_id,msg_id,'*وجـ؏ـاا شڪوو 😹💕*',"md",true)  
end
if text == 'هلاو' or text == 'هلا' then
return LuaTele.sendText(msg_chat_id,msg_id,'*ههلا عمࢪيي انࢪت 💕*',"md",true)  
end
if text == 'نعم' or text == 'اي' then
return LuaTele.sendText(msg_chat_id,msg_id,'*ايي صحح 😐*',"md",true)  
end
if text == '🙄' or text == '🙄🙄' then
return LuaTele.sendText(msg_chat_id,msg_id,'*نزل عينڪك حبي 👀💘*',"md",true)  
end
if text == 'وين' or text == 'رايح' then
return LuaTele.sendText(msg_chat_id,msg_id,'*بـس ابول واجي 😹💘*',"md",true)  
end
if text == '😂' or text == '😂😂' then
return LuaTele.sendText(msg_chat_id,msg_id,'*شۿلضحڪة يࢪبيي 💘😩*',"md",true)  
end
if text == '😹' or text == '😹' then
return LuaTele.sendText(msg_chat_id,msg_id,'*شۿلضحڪة يࢪبيي 💘😩*',"md",true)  
end
if text == 'شونك' or text == 'شلونك' then
return LuaTele.sendText(msg_chat_id,msg_id,'*بخيࢪ حيليي وانتةة 😩💘*',"md",true)  
end
if text == 'انجب' or text == 'نجب' then
return LuaTele.sendText(msg_chat_id,msg_id,'*صاࢪ عمࢪيي 💘😩*',"md",true)  
end
if text == 'شبيك' or text == 'اشبيك' then
return LuaTele.sendText(msg_chat_id,msg_id,'*مابيۿ عمࢪيي 😩💘*',"md",true)  
end
if text == '😭' or text == '😭😭' then
return LuaTele.sendText(msg_chat_id,msg_id,'*منو وياڪك عمࢪي 🥺*',"md",true)  
end
if text == '🥺' or text == '🥺🥺' then
return LuaTele.sendText(msg_chat_id,msg_id,'*ليش الححلو زعلان .؟ 💝*',"md",true)  
end
if text == '😒' or text == '😒😒' then
return LuaTele.sendText(msg_chat_id,msg_id,'*عدل وجهڪك 😒🙄*',"md",true)  
end
if text == 'احبك' or text == 'حبق' then
return LuaTele.sendText(msg_chat_id,msg_id,'*موتبيڪك حيلي 😩💘*',"md",true)  
end
if text == 'مح' or text == 'محح' then
return LuaTele.sendText(msg_chat_id,msg_id,'*عسلل يࢪوحي 💕🤤*',"md",true)  
end
if text == 'هلا' or text == 'هلو' then
return LuaTele.sendText(msg_chat_id,msg_id,'*ههلا ڪلبي نوࢪت 💘*',"md",true)  
end
if text == 'فرخ' or text == 'كحبه' then
return LuaTele.sendText(msg_chat_id,msg_id,'*وينة بلا خلي احصࢪة 🤤💘*',"md",true)  
end
if text == 'الحمد الله' or text == 'بخير الحمد الله' then
return LuaTele.sendText(msg_chat_id,msg_id,'*عساا دوم يࢪوحي 🤧*',"md",true)  
end
if text == 'تفف' or text == 'تف' then
return LuaTele.sendText(msg_chat_id,msg_id,'*اوفف عسلل ☺️💘*',"md",true)  
end
if text == 'خاص' or text == 'خ' then
return LuaTele.sendText(msg_chat_id,msg_id,'*هها شني اخذتها 👀💘*',"md",true)  
end
if text == 'صباح الخير' or text == 'مساء الخير' then
return LuaTele.sendText(msg_chat_id,msg_id,'*وانت ڪل الخيࢪ حيلي ☺️💘*',"md",true)  
end
if text == 'بلش' or text == 'نتعرف' then
return LuaTele.sendText(msg_chat_id,msg_id,'*انيي بوت عمࢪي شوف لباقين 💕👀*',"md",true)  
end
if text == 'عسل' or text == 'عسلل' then
return LuaTele.sendText(msg_chat_id,msg_id,'*حلاتڪك حيلي 💝*',"md",true)  
end
if text == 'اه' or text == 'ااه' then
return LuaTele.sendText(msg_chat_id,msg_id,'*عييب منا العالم ولڪك 😉😂*',"md",true)  
end
if text == 'ليش' or text == 'هايلش' then
return LuaTele.sendText(msg_chat_id,msg_id,'*بڪيفيي 🥳*',"md",true)  
end
if text == 'بوتي' or text == 'بوتيي' then
return LuaTele.sendText(msg_chat_id,msg_id,'شبيي بوتڪك 🙄😂',"md",true)  
end
if text == 'تعال' or text == 'تع' then
return LuaTele.sendText(msg_chat_id,msg_id,'*ڪول حب 😩💕*',"md",true)  
end
if text == 'مانايم' or text == 'نعسان ' then
return LuaTele.sendText(msg_chat_id,msg_id,'*مشي ننام شعندڪك ڪاعد 💝👀*',"md",true)  
end
if text == 'منور' or text == 'نورت' then
return LuaTele.sendText(msg_chat_id,msg_id,'*نوࢪڪك يࢪوحي 🤤💝*',"md",true)  
end
if text == 'ضوجه' or text == 'ضايج' then
return LuaTele.sendText(msg_chat_id,msg_id,'*ليش يڪلبي سولف 🥳💝*',"md",true)  
end
if text == 'ويت' or text == 'ويتت' then
return LuaTele.sendText(msg_chat_id,msg_id,'*شنو هلثقافة يࢪبي 😉😂*',"md",true)  
end
if text == 'خخخ' or text == 'اخخ' then
return LuaTele.sendText(msg_chat_id,msg_id,'*شبيڪك عمࢪيي منو وياك 🙄*',"md",true)  
end
if text == 'شكرا' or text == 'مرسي' then
return LuaTele.sendText(msg_chat_id,msg_id,'*العفوو حيلي 🥳💕*',"md",true)  
end
if text == 'حلوه' or text == 'حلو' then
return LuaTele.sendText(msg_chat_id,msg_id,'*ححلاة ويهڪك هذا 🤤💕*',"md",true)  
end
if text == 'بموت' or text == 'حموتت' then
return LuaTele.sendText(msg_chat_id,msg_id,'*اسم الله عليڪك حيلي 💝*',"md",true)  
end
if text == 'وك' or text == 'كك' then
return LuaTele.sendText(msg_chat_id,msg_id,'**',"md",true)  
end
if text == 'طيب' or text == 'تيب' then
return LuaTele.sendText(msg_chat_id,msg_id,'*اوڪك حب 💝.*',"md",true)  
end
if text == '،' or text == '.' then
return LuaTele.sendText(msg_chat_id,msg_id,'*استغفࢪالله العضيم واتوب اليه 💝*',"md",true)  
end
if text == 'جيت' or text == 'اجيت' then
return LuaTele.sendText(msg_chat_id,msg_id,'*ڪل الهلا ححيلي 🥳💕*',"md",true)  
end
if text == 'كافي' or text == 'كاافي' then
return LuaTele.sendText(msg_chat_id,msg_id,'*تـم ححيلي 🤐*',"md",true)  
end

if text == 'حبيبي' or text == 'حبيبتي' then
return LuaTele.sendText(msg_chat_id,msg_id,'*هاا يࢪوحح مالتي 😩💘*',"md",true)  
end
if text == 'تمام' or text == 'تمم' then
return LuaTele.sendText(msg_chat_id,msg_id,'* ࢪبي يتمم عليڪك بالخيࢪ 💕🥳*',"md",true)  
end
if text == 'خلاص' or text == 'خلص' then
return LuaTele.sendText(msg_chat_id,msg_id,'*اني شعليۿہ 🙄💕*',"md",true)  
end
if text == 'حبك' or text == 'احبك' then
return LuaTele.sendText(msg_chat_id,msg_id,'*اموت بيڪك يࢪوحي 🥳💘*',"md",true)  
end
--------------------------------------------------------------------------------------------------------------
if text == "فتح الاضافه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(itsspider.."spider:Lock:AddMempar"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح اضافة الاعضاء").unLock,"md",true)  
return false end 
if text == "فتح الفشار" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(itsspider.."spider:Lock:Fshar"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الفشار في المجموعة").unLock,"md",true)  
return false end 
if text == "فتح الطائفيه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(itsspider.."spider:Lock:Taf"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الطائفيه في المجموعة").unLock,"md",true)  
return false end 
if text == "فتح الكفر" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(itsspider.."spider:Lock:Kfr"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الكفر في المجموعة").unLock,"md",true)  
return false end 
if text == "فتح الفارسيه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(itsspider.."spider:Lock:Farsi"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الفارسيه في المجموعة").unLock,"md",true)  
return false end 
if text == "فتح الانكليزيه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(itsspider.."spider:Lock:F1arsi"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الانكليزيه في المجموعة").unLock,"md",true)  
return false end 
if text == "فتح الدردشه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(itsspider.."spider:Lock:text"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الدردشه").unLock,"md",true)  
return false end 
if text == "فتح الدخول" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(itsspider.."spider:Lock:Join"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح دخول الاعضاء").unLock,"md",true)  
return false end 
if text == "فتح البوتات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(itsspider.."spider:Lock:Bot:kick"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح البوتات").unLock,"md",true)  
return false end 
if text == "فتح البوتات " then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(itsspider.."spider:Lock:Bot:kick"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح البوتات").unLock,"md",true)  
return false end 
if text == "فتح الاشعارات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end  
Redis:del(itsspider.."spider:Lock:tagservr"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الاشعارات").unLock,"md",true)  
return false end 
if text == "فتح التثبيت" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(itsspider.."spider:lockpin"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح التثبيت هنا").unLock,"md",true)  
return false end 
if text == "فتح التعديل" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(itsspider.."spider:Lock:edit"..msg_chat_id) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح تعديل").unLock,"md",true)  
return false end 
if text == "فتح تعديل الميديا" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(itsspider.."spider:Lock:edit"..msg_chat_id) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح تعديل").unLock,"md",true)  
return false end 
if text == "فتح الكل" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(itsspider.."spider:Lock:tagservrbot"..msg_chat_id)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:del(itsspider..'spider:'..lock..msg_chat_id)    
end
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*⌁ : تم فتح جميع الاوامر*").unLock,"md",true)  
return false end

if text == "@all" or text == "تاك عام" or text == "all" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "*", 200)
x = 0
tags = 0
local list = Info_Members.members
for k, v in pairs(list) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if x == 5 or x == tags or k == 0 then
tags = x + 5
listall = ""
end
x = x + 1
if UserInfo.first_name ~= '' then
listall = listall.." ["..UserInfo.first_name.."](tg://user?id="..UserInfo.id.."),"
end
if x == 5 or x == tags or k == 0 then
LuaTele.sendText(msg_chat_id,msg_id,listall,"md",true)  
end
end
end


if text == "غنيلي" then
if not Redis:get(itsspider.."spider:Status:distraction1"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : عذراً امر غنيلي معطل","md",true) end 
Abs = math.random(4,2824); 
local Text ='⌁ : تم اختيار المقطع الصوتي لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/Song'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/AudiosDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) end
if text == "متحركه" then
if not Redis:get(itsspider.."spider:Status:distraction2"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : عذراً امر متحركه معطل","md",true) end 
Abs = math.random(4,1075); 
local Text ='⌁ : تم اختيار المتحركه لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/animation'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendanimation?chat_id=' .. msg.chat_id .. '&animation=https://t.me/GifDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) end
if text == "شعر" then
if not Redis:get(itsspider.."spider:Status:distraction3"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : عذراً امر شعر معطل","md",true) end 
Abs = math.random(4,140); 
local Text ='⌁ : تم اختيار الشعر لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/voice'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/L1BBBL/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "ميمز" then
if not Redis:get(itsspider.."spider:Status:distraction9"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : عذراً امر ميمز معطل","md",true) end 
Abs = math.random(4,1201); 
local Text ='⌁ : تم اختيار الميمز لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/Memz'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/MemzDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "ريمكس" or text == "ريماكس" then 
if not Redis:get(itsspider.."spider:Status:distraction8"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : عذراً امر ريمكس معطل","md",true) end 
Abs = math.random(4,612); 
local Text ='⌁ : تم اختيار ريمكس لك'
keyboardd = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/Remix'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/RemixDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "فلم" or text == "فيلم" then 
if not Redis:get(itsspider.."spider:Status:distraction4"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : عذراً امر فلم معطل","md",true) end 
Abs = math.random(4,125); 
local Text ='⌁ : تم اختيار الفلم لك'
keyboardd = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/Movies'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/MoviesDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "انمي" or text == "انميي" then 
if not Redis:get(itsspider.."spider:Status:distraction7"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : عذراً امر انمي معطل","md",true) end 
Abs = math.random(4,1002); 
local Text ='⌁ : تم اختيار الانمي لك'
keyboardd = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/Anime'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/AnimeDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "اغنيه" or text == "اغنية" then
if not Redis:get(itsspider.."spider:Status:distraction6"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : عذراً امر اغنيه معطل","md",true) end 
Abs = math.random(4,1167); 
local Text ='⌁ : تم اختيار الاغنيه لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/Mp'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendAudio?chat_id=' .. msg.chat_id .. '&audio=https://t.me/DavidMp3/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "صوره" or text == "صورة" then
if not Redis:get(itsspider.."spider:Status:distraction5"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : عذراً امر صوره معطل","md",true) end 
Abs = math.random(4,1171); 
local Text ='⌁ : تم اختيار الصوره لك'
keyboardd = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/Photos'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/PhotosDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "مسلسل" then
if not Redis:get(itsspider.."spider:Status:distraction10"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : عذراً امر مسلسل معطل","md",true) end 
Abs = math.random(4,54); 
local Text ='⌁ : تم اختيار المسلسل لك'
keyboardd = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/Series'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/SeriesDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == 'تغيير الايدي' or text == 'تغير الايدي' then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
local List = {
[[
، 𝚞𝚜𝚎𝚛 : #username .
، 𝚖𝚜𝚐 : #msgs .
، 𝚜𝚝𝚊 : #stast .
، 𝚒𝚍 : #id .
]],
[[
◜𝗨َِS𝗘ِr : #username 🕷 .  
◜𝗠ِsِG : #msgs .
◜𝗦َt : #stast .
◜𝗜ِd : #id 🕸 .
]],
[[
˖ˑ Uຮّꫀ𝚛ꪀᥲꪔ  ࣪ ᥫ᭡ #username
˖ˑ ຮّ𝚝ᥲຮّ𝚝  ࣪ ᥫ᭡  #stast
˖ˑ ᎥĐ ࣪ ᥫ᭡ #id
˖ˑ 𝙶ᥲꪔꫀຮ  ࣪ ᥫ᭡ #game
˖ˑ ꪔຮّ𝙶ຮ  ࣪ ᥫ᭡  #msgs
]],
[[
. 𝗎𝗌𝖾𝗋 › #username . 
. 𝗌𝗍α › #stast . 
. 𝗂𝖽 › #id . 
. 𝗆𝗌𝗀 › #msgs .
]],
[[
∵ ꪊ᥉ꫀɾ  ˛ #username ٫
∵ ᥉ƚꪖ  ˛ #stast ٫
∵ Ꭵᦔ  ˛ #id 🥡٫
∵ ꪑ᥉ᧁ  ˛ #msgs 🥡٫
]],
[[
〝 𝗎𝗦ꫀ : #username .
〝 𝖲𝗍ɑ : #stast  . 
〝 ⁪⁬⁮Μsg : #msgs 📍.
〝 َ𝖨ժ : #id 📍.
]],
[[
∴ 𝗎!𝗌 : #username  .
∴ 𝗌!?? : #stast  .
∴ 𝗂!𝖽 : #id 🩸 .
∴ ??!𝗀 : #msgs 🩸.
]],
[[
˛ USER . #username ˛
˛ STAST . #stast ˛
˛ ID . #id 🥢˛
˛ MSGS . #msgs 🥢˛
]],
[[
: 𝖴ِ᥉ᥱ : #username .
: Sƚِᥲ : #stast .
: Iَժ : #id 📌.
: 𝖬⁪⁬⁮᥉َ𝗀 : #msgs 📌.
]],
[[
: 𝚄𝚂𝙴𝚁 ، #username  .
: 𝙼𝚂𝙶 ، #msgs  .
: 𝚂𝚃𝙰 ، #stast  .
: 𝙸𝙳 ، #id  .
]],
[[
◜ 𝗨َِS𝗘ِr #username 🕷 .  
◜ 𝗠ِsِG #msgs   .
◜ 𝗦َ𝗧 #stast  .
◜ 𝗜ِd #id 🕸 .
]],
[[
. USERNAME . #username
. STAST . #stast
. ID . #id
. MSGS . #msgs
]],
[[
˛ 𝗎!𝗌 : #username ٰ⛓️ '.
˛ 𝗆!𝗀 #msgs .
˛ 𝗌!𝗍 : #stast .
˛ 𝗂!𝖽 : #id ⛓️ '.
]],
[[
› Msgs : #msgs .🦇
› ID : #id .
› Stast : #stast .
› UserName : #username .🦇
]],
[[
: 𝖴ِᥱ᥉ : #username .
: Iَժ : #id .
: Sƚِᥲ : #stast .
: 𝖬⁪⁬⁮᥉َ𝗀 : #msgs .
]]} 
local Text_Rand = List[math.random(#List)] 
Redis:set(itsspider.."spider:Set:Id:Group"..msg.chat_id,Text_Rand)
return LuaTele.sendText(msg_chat_id,msg_id, '⌁ : تم التغيير ارسل ايدي لعرض الايدي الجديد',"md",true)  end
--------------------------------------------------------------------------------------------------------------
if text == "تعطيل all" or text == "تعطيل @all" then 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌔︙هذا الامر للادمنية واعلى فقط',"md",true)  
end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌔︙عذراً لاتستطيع استخدام البوت !\n⌔︙عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup)
end
Redis:set(itsspider.."spider:lockalllll"..msg_chat_id,"off")
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ :  تم قفـل @all هنا").Lock,"md",true)  
return false
end
if text == "تفعيل all" or text == "تفعيل @all" then 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌔︙هذا الامر للادمنية واعلى فقط',"md",true)  
end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌔︙عذراً لاتستطيع استخدام البوت !\n⌔︙عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup)
end
Redis:set(itsspider.."spider:lockalllll"..msg_chat_id,"on")
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ :  تم فتح @all هنا").Lock,"md",true)  
return false
end 
if text == "قفل القنوات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌔︙هذا الامر للادمنية واعلى فقط',"md",true)  
end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌔︙عذراً لاتستطيع استخدام البوت !\n⌔︙عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup)
end
Redis:set(itsspider.."spider:Lock:channell"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ :  تم قفـل القنوات").Lock,"md",true)  
return false
end
if text == "فتح القناه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌔︙هذا الامر للادمنية واعلى فقط',"md",true)  
end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌔︙عذراً لاتستطيع استخدام البوت !\n⌔︙عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup)
end
Redis:del(itsspider.."spider:Lock:channell"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ :  تم فتح القنوات").unLock,"md",true)  
return false
end 
if text == "قفل التكرار" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:hset(itsspider.."spider:Spam:Group:User"..msg_chat_id ,"Spam:User","del")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل التكرار").Lock,"md",true)  
elseif text == "قفل التكرار بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:hset(itsspider.."spider:Spam:Group:User"..msg_chat_id ,"Spam:User","keed")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل التكرار").lockKid,"md",true)  
elseif text == "قفل التكرار بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:hset(itsspider.."spider:Spam:Group:User"..msg_chat_id ,"Spam:User","mute")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل التكرار").lockKtm,"md",true)  
elseif text == "قفل التكرار بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:hset(itsspider.."spider:Spam:Group:User"..msg_chat_id ,"Spam:User","kick")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل التكرار").lockKick,"md",true)  
elseif text == "فتح التكرار" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:hdel(itsspider.."spider:Spam:Group:User"..msg_chat_id ,"Spam:User")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح التكرار").unLock,"md",true)  end
if text == "قفل الروابط" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Link"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الروابط").Lock,"md",true)  
return false end 
if text == "قفل الروابط بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Link"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الروابط").lockKid,"md",true)  
return false end 
if text == "قفل الروابط بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Link"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الروابط").lockKtm,"md",true)  
return false end 
if text == "قفل الروابط بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Link"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الروابط").lockKick,"md",true)  
return false end 
if text == "فتح الروابط" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Lock:Link"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الروابط").unLock,"md",true)  
return false end 
if text == "قفل المعرفات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:User:Name"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل المعرفات").Lock,"md",true)  
return false end 
if text == "قفل المعرفات بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:User:Name"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل المعرفات").lockKid,"md",true)  
return false end 
if text == "قفل المعرفات بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:User:Name"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل المعرفات").lockKtm,"md",true)  
return false end 
if text == "قفل المعرفات بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:User:Name"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل المعرفات").lockKick,"md",true)  
return false end 
if text == "فتح المعرفات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Lock:User:Name"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح المعرفات").unLock,"md",true)  
return false end 
if text == "قفل التاك" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:hashtak"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل التاك").Lock,"md",true)  
return false end 
if text == "قفل التاك بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:hashtak"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل التاك").lockKid,"md",true)  
return false end 
if text == "قفل التاك بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:hashtak"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل التاك").lockKtm,"md",true)  
return false end 
if text == "قفل التاك بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:hashtak"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل التاك").lockKick,"md",true)  
return false end 
if text == "فتح التاك" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Lock:hashtak"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح التاك").unLock,"md",true)  
return false end 
if text == "قفل الشارحه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Cmd"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الشارحه").Lock,"md",true)  
return false end 
if text == "قفل الشارحه بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Cmd"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الشارحه").lockKid,"md",true)  
return false end 
if text == "قفل الشارحه بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Cmd"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الشارحه").lockKtm,"md",true)  
return false end 
if text == "قفل الشارحه بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Cmd"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الشارحه").lockKick,"md",true)  
return false end 
if text == "فتح الشارحه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Lock:Cmd"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الشارحه").unLock,"md",true)  
return false end 
if text == "قفل الصور"then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Photo"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الصور").Lock,"md",true)  
return false end 
if text == "قفل الصور بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Photo"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الصور").lockKid,"md",true)  
return false end 
if text == "قفل الصور بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Photo"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الصور").lockKtm,"md",true)  
return false end 
if text == "قفل الصور بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Photo"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الصور").lockKick,"md",true)  
return false end 
if text == "فتح الصور" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Lock:Photo"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الصور").unLock,"md",true)  
return false end 
if text == "قفل الفيديو" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Video"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الفيديو").Lock,"md",true)  
return false end 
if text == "قفل الفيديو بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Video"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الفيديو").lockKid,"md",true)  
return false end 
if text == "قفل الفيديو بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Video"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الفيديو").lockKtm,"md",true)  
return false end 
if text == "قفل الفيديو بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Video"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الفيديو").lockKick,"md",true)  
return false end 
if text == "فتح الفيديو" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Lock:Video"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الفيديو").unLock,"md",true)  
return false end 
if text == "قفل المتحركه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Animation"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل المتحركه").Lock,"md",true)  
return false end 
if text == "قفل المتحركه بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Animation"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل المتحركه").lockKid,"md",true)  
return false end 
if text == "قفل المتحركه بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Animation"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل المتحركه").lockKtm,"md",true)  
return false end 
if text == "قفل المتحركه بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Animation"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل المتحركه").lockKick,"md",true)  
return false end 
if text == "فتح المتحركه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Lock:Animation"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح المتحركه").unLock,"md",true)  
return false end 
if text == "قفل الالعاب" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:geam"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الالعاب").Lock,"md",true)  
return false end 
if text == "قفل الالعاب بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:geam"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الالعاب").lockKid,"md",true)  
return false end 
if text == "قفل الالعاب بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:geam"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الالعاب").lockKtm,"md",true)  
return false end 
if text == "قفل الالعاب بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:geam"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الالعاب").lockKick,"md",true)  
return false end 
if text == "فتح الالعاب" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Lock:geam"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الالعاب").unLock,"md",true)  
return false end 
if text == "قفل الاغاني" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Audio"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الاغاني").Lock,"md",true)  
return false end 
if text == "قفل الاغاني بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Audio"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الاغاني").lockKid,"md",true)  
return false end 
if text == "قفل الاغاني بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Audio"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الاغاني").lockKtm,"md",true)  
return false end 
if text == "قفل الاغاني بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Audio"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الاغاني").lockKick,"md",true)  
return false end 
if text == "فتح الاغاني" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Lock:Audio"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الاغاني").unLock,"md",true)  
return false end 
if text == "قفل الصوت" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:vico"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الصوت").Lock,"md",true)  
return false end 
if text == "قفل الصوت بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:vico"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الصوت").lockKid,"md",true)  
return false end 
if text == "قفل الصوت بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:vico"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الصوت").lockKtm,"md",true)  
return false end 
if text == "قفل الصوت بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:vico"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الصوت").lockKick,"md",true)  
return false end 
if text == "فتح الصوت" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Lock:vico"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الصوت").unLock,"md",true)  
return false end 
if text == "قفل الكيبورد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Keyboard"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الكيبورد").Lock,"md",true)  
return false end 
if text == "قفل الكيبورد بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Keyboard"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الكيبورد").lockKid,"md",true)  
return false end 
if text == "قفل الكيبورد بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Keyboard"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الكيبورد").lockKtm,"md",true)  
return false end 
if text == "قفل الكيبورد بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Keyboard"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الكيبورد").lockKick,"md",true)  
return false end 
if text == "فتح الكيبورد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Lock:Keyboard"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الكيبورد").unLock,"md",true)  
return false end 
if text == "قفل الملصقات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Sticker"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الملصقات").Lock,"md",true)  
return false end 
if text == "قفل الملصقات بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Sticker"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الملصقات").lockKid,"md",true)  
return false end 
if text == "قفل الملصقات بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Sticker"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الملصقات").lockKtm,"md",true)  
return false end 
if text == "قفل الملصقات بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Sticker"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الملصقات").lockKick,"md",true)  
return false end 
if text == "فتح الملصقات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Lock:Sticker"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الملصقات").unLock,"md",true)  
return false end 
if text == "قفل التوجيه" then 
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:forward"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل التوجيه").Lock,"md",true)  
return false end 
if text == "قفل التوجيه بالتقيد" then 
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:forward"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل التوجيه").lockKid,"md",true)  
return false end 
if text == "قفل التوجيه بالكتم" then 
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:forward"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل التوجيه").lockKtm,"md",true)  
return false end 
if text == "قفل التوجيه بالطرد" then 
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:forward"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل التوجيه").lockKick,"md",true)  
return false end 
if text == "فتح التوجيه" then 
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Lock:forward"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح التوجيه").unLock,"md",true)  
return false end 
if text == "قفل الملفات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Document"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الملفات").Lock,"md",true)  
return false end 
if text == "قفل الملفات بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Document"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الملفات").lockKid,"md",true)  
return false end 
if text == "قفل الملفات بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Document"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الملفات").lockKtm,"md",true)  
return false end 
if text == "قفل الملفات بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Document"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الملفات").lockKick,"md",true)  
return false end 
if text == "فتح الملفات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Lock:Document"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الملفات").unLock,"md",true)  
return false end 
if text == "قفل السيلفي" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Unsupported"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل السيلفي").Lock,"md",true)  
return false end 
if text == "قفل السيلفي بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Unsupported"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل السيلفي").lockKid,"md",true)  
return false end 
if text == "قفل السيلفي بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Unsupported"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل السيلفي").lockKtm,"md",true)  
return false end 
if text == "قفل السيلفي بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Unsupported"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل السيلفي").lockKick,"md",true)  
return false end 
if text == "فتح السيلفي" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Lock:Unsupported"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح السيلفي").unLock,"md",true)  
return false end 
if text == "قفل الماركداون" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Markdaun"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الماركداون").Lock,"md",true)  
return false end 
if text == "قفل الماركداون بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Markdaun"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الماركداون").lockKid,"md",true)  
return false end 
if text == "قفل الماركداون بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Markdaun"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الماركداون").lockKtm,"md",true)  
return false end 
if text == "قفل الماركداون بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Markdaun"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الماركداون").lockKick,"md",true)  
return false end 
if text == "فتح الماركداون" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Lock:Markdaun"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الماركداون").unLock,"md",true)  
return false end 
if text == "قفل الجهات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Contact"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الجهات").Lock,"md",true)  
return false end 
if text == "قفل الجهات بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Contact"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الجهات").lockKid,"md",true)  
return false end 
if text == "قفل الجهات بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Contact"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الجهات").lockKtm,"md",true)  
return false end 
if text == "قفل الجهات بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Contact"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الجهات").lockKick,"md",true)  
return false end 
if text == "فتح الجهات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Lock:Contact"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الجهات").unLock,"md",true)  
return false end 
if text == "قفل الكلايش" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Spam"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الكلايش").Lock,"md",true)  
return false end 
if text == "قفل الكلايش بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Spam"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الكلايش").lockKid,"md",true)  
return false end 
if text == "قفل الكلايش بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Spam"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الكلايش").lockKtm,"md",true)  
return false end 
if text == "قفل الكلايش بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Spam"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الكلايش").lockKick,"md",true)  
return false end 
if text == "فتح الكلايش" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Lock:Spam"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الكلايش").unLock,"md",true)  
return false end 
if text == "قفل الانلاين" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Inlen"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الانلاين").Lock,"md",true)  
return false end 
if text == "قفل الانلاين بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Inlen"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الانلاين").lockKid,"md",true)  
return false end 
if text == "قفل الانلاين بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Inlen"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الانلاين").lockKtm,"md",true)  
return false end 
if text == "قفل الانلاين بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Lock:Inlen"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم قفل الانلاين").lockKick,"md",true)  
return false end 
if text == "فتح الانلاين" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Lock:Inlen"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"⌁ : تم فتح الانلاين").unLock,"md",true)  
return false end 
if text == "ضع رابط" or text == "وضع رابط" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closeLINK'},},}}
Redis:setex(itsspider.."spider:Set:Link"..msg_chat_id..""..msg.sender.user_id,120,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل رابط المجموعة او رابط قناة المجموعة","md",false, false, false, false, reply_markup)  end
if text == "مسح الرابط" or text == "حذف الرابط" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Group:Link"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم مسح الرابط ","md",true)             
end
if text == "الرابط" then
if not Redis:get(itsspider.."spider:Status:Link"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"⌔︙تم تعطيل جلب الرابط من قبل الادمنيه","md",true)
end 
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ نص ›', data = msg.sender.user_id..'/LinKTexT' },{ text = '‹ انلاين ›', data = msg.sender.user_id..'/LinKOnla' },
 },
 { 
{ text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr' }
 },
 { 
{ text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw' }, 
 },
 }
 }
 return LuaTele.sendText(msg_chat_id,msg_id,'*⌔︙اختر نوع الرابط الذي تريده*',"md",false, false, false, false, reply_markup)
end
-- OR33 --
if text == 'غادر' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/Nobot'},{text = '‹ تأكيد ›', data = msg.sender.user_id..'/Yesbot'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : هل انت متأكد من مغادرة البوت !',"md",false, false, false, false, reply_markup) end
--
if text == 'نزلني' then
if not Redis:get(itsspider.."spider:Status:remMe"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : امر نزلني تم تعطيله من قبل المدراء *","md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/TkNo'},{text = '‹ تأكيد ›', data = msg.sender.user_id..'/TkYes'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : هل انت متأكد من عملية تنزيلك !',"md",false, false, false, false, reply_markup) end
--
if text == 'اطردني' or text == 'طردني' then
if not Redis:get(itsspider.."spider:Status:KickMe"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : امر اطردني تم تعطيله من قبل المدراء *","md",true)  end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if StatusCanOrNotCan(msg_chat_id,msg.sender.user_id) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا استطيع استخدام الامر على ‹ "..Controller(msg_chat_id,msg.sender.user_id).." › *","md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/noBanme'},{text = '‹ تأكيد ›', data = msg.sender.user_id..'/Banme'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : هل انت متأكد من عملية طردك !',"md",false, false, false, false, reply_markup) end
-- OR33 --
if text == "ضع ترحيب" or text == "وضع ترحيب" then  
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closeWelcome'},},}}
Redis:setex(itsspider.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender.user_id, 120, true)  
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل لي الترحيب الان".."\n⌁ : تستطيع اضافة مايلي !\n⌁ : دالة عرض الاسم ↫ ‹ `name` ›\n⌁ : دالة عرض المعرف ↫ ‹ `user` ›\n⌁ : دالة عرض اسم المجموعة ↫ ‹ `NameCh` ›","md",false, false, false, false, reply_markup)   
end
if text == "الترحيب" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:get(itsspider.."spider:Status:Welcome"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل الترحيب من قبل الادمنيه","md",true) end 
local Welcome = Redis:get(itsspider.."spider:Welcome:Group"..msg_chat_id)
if Welcome then 
return LuaTele.sendText(msg_chat_id,msg_id,Welcome,"md",true)   
else 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لم يتم تعيين ترحيب للمجموعة","md",true)   
end 
end
if text == "مسح الترحيب" or text == "حذف الترحيب" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Welcome:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم ازالة ترحيب المجموعة","md",true)   
end
if text == "ضع قوانين" or text == "وضع قوانين" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closeRules'},},}}
Redis:setex(itsspider.."spider:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل لي القوانين الان","md",false, false, false, false, reply_markup)  end
if text == "مسح القوانين" or text == "حذف القوانين" then  
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Group:Rules"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم ازالة قوانين المجموعة","md",true)    
end
if text == "القوانين" then 
local Rules = Redis:get(itsspider.."spider:Group:Rules" .. msg_chat_id)   
if Rules then     
return LuaTele.sendText(msg_chat_id,msg_id,Rules,"md",true)     
else      
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا توجد قوانين هنا","md",true)     
end    
end
if text == "ضع وصف" or text == "وضع وصف" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).Info == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closeDescription'},},}}
Redis:setex(itsspider.."spider:Set:Description:" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل لي وصف المجموعة الان","md",false, false, false, false, reply_markup)  end
if text == "مسح الوصف" or text == "حذف الوصف" then  
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).Info == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  end
LuaTele.setChatDescription(msg_chat_id, '') 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم ازالة وصف المجموعة","md",true)    
end
if text and text:match("^ضع اسم (.*)") or text and text:match("^وضع اسم (.*)") then 
local NameChat = text:match("^ضع اسم (.*)") or text:match("^وضع اسم (.*)") 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).Info == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  end
LuaTele.setChatTitle(msg_chat_id,NameChat)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تغيير اسم المجموعة الى ‹ "..NameChat.." ›","md",true)    
end
if text == ("ضع صوره") then  
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if GetInfoBot(msg).Info == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  end
Redis:set(itsspider.."spider:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل الصوره لوضعها","md",true)    
end
if text == "مسح قائمه المنع" or text == "مسح قائمة المنع" or text == "حذف قائمه المنع" or text == "حذف قائمة المنع" then   
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(itsspider.."spider:List:Filter"..msg_chat_id)  
if #list == 0 then  
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : لا يوجد كلمات ممنوعه هنا *","md",true)   
end  
for k,v in pairs(list) do  
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
Redis:del(itsspider.."spider:Filter:Group:"..v..msg_chat_id)  
Redis:srem(itsspider.."spider:List:Filter"..msg_chat_id,v)  end  
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#list.." › من الممنوعات *","md",true)   
end
if text == "قائمه المنع" or text == "قائمة المنع" then   
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(itsspider.."spider:List:Filter"..msg_chat_id)  
if #list == 0 then  
return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا توجد ممنوعات هنا *","md",true)   
end  
Filter = '\n*⌁ : قائمة المنع ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k,v in pairs(list) do  
print(v)
if v:match('photo:(.*)') then
ver = 'صوره'
elseif v:match('animation:(.*)') then
ver = 'متحركه'
elseif v:match('sticker:(.*)') then
ver = 'ملصق'
elseif v:match('text:(.*)') then
ver = v:gsub('text:',"") 
end
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
local Text_Filter = Redis:get(itsspider.."spider:Filter:Group:"..v..msg_chat_id)   
Filter = Filter.."*"..k.."- "..ver.." ↫ ( "..Text_Filter.." )*\n"    
end  
LuaTele.sendText(msg_chat_id,msg_id,Filter,"md",true)  end  
if text == "منع" then       
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider..'spider:FilterText'..msg_chat_id..':'..msg.sender.user_id,'true')
return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : ارسل الان ( ملصق ,متحركه ,صوره ,رساله ) *',"md",true)  end    
if text == "الغاء منع" then    
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider..'spider:FilterText'..msg_chat_id..':'..msg.sender.user_id,'DelFilter')
return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : ارسل الان ( ملصق ,متحركه ,صوره ,رساله ) *',"md",true)  end
if text == "اضف امر" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Command:Reids:Group"..msg_chat_id..":"..msg.sender.user_id,"true") 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : الان ارسل لي الامر القديم","md",true) end
if text == "حذف امر" or text == "مسح امر" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender.user_id,"true") 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل الان الامر الذي قمت بوضعه مكان الامر القديم","md",true) end
if text == "حذف الاوامر المضافه" or text == "مسح الاوامر المضافه" then 
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(itsspider.."spider:Command:List:Group"..msg_chat_id)
for k,v in pairs(list) do
Redis:del(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..v)
Redis:del(itsspider.."spider:Command:List:Group"..msg_chat_id) end
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم مسح جميع الاوامر التي تم اضافتها","md",true) end
if text == "الاوامر المضافه" then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(itsspider.."spider:Command:List:Group"..msg_chat_id.."")
Command = "⌁ : قائمه الاوامر المضافه ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
Commands = Redis:get(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..v)
if Commands then 
Command = Command..""..k.." - ‹ "..v.." › ↫ ‹ "..Commands.." ›\n"
else
Command = Command..""..k.." - ‹ "..v.." › \n" end end
if #list == 0 then
Command = "⌁ : لا توجد اوامر اضافيه"
end
return LuaTele.sendText(msg_chat_id,msg_id,Command,"md",true) end
if text == "تثبيت" and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).PinMsg == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  end
LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : تم تثبيت الرساله","md",true)
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local PinMsg = LuaTele.pinChatMessage(msg_chat_id,Message_Reply.id,true) end
if text == 'الغاء التثبيت' and msg.reply_to_message_id ~= 0 or text == 'الغاء تثبيت' and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).PinMsg == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  end
LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : تم الغاء تثبيت الرساله","md",true)
https.request('https://api.telegram.org/bot'..Token..'/unpinChatMessages?chat_id='..msg.chat_id)
LuaTele.unpinChatMessage(msg_chat_id) end
if text == 'الغاء تثبيت الكل' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).PinMsg == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  end
LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : تم الغاء تثبيت جميع الرسائل","md",true)
https.request('https://api.telegram.org/bot'..Token..'/unpinAllChatMessages?chat_id='..msg.chat_id)
for i=0, 20 do
local UnPin = LuaTele.unpinChatMessage(msg_chat_id) 
if not LuaTele.getChatPinnedMessage(msg_chat_id).id then
break end end
end
if text == "الحمايه" then    
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'تعطيل الرابط', data = msg.sender.user_id..'/'.. 'unmute_link'},{text = 'تفعيل الرابط', data = msg.sender.user_id..'/'.. 'mute_link'},},{{text = 'تعطيل الترحيب', data = msg.sender.user_id..'/'.. 'unmute_welcome'},{text = 'تفعيل الترحيب', data = msg.sender.user_id..'/'.. 'mute_welcome'},},{{text = 'تعطيل الايدي', data = msg.sender.user_id..'/'.. 'unmute_Id'},{text = 'تفعيل الايدي', data = msg.sender.user_id..'/'.. 'mute_Id'},},{{text = 'تعطيل الايدي بالصوره', data = msg.sender.user_id..'/'.. 'unmute_IdPhoto'},{text = 'تفعيل الايدي بالصوره', data = msg.sender.user_id..'/'.. 'mute_IdPhoto'},},{{text = 'تعطيل ردود المدير', data = msg.sender.user_id..'/'.. 'unmute_ryple'},{text = 'تفعيل ردود المدير', data = msg.sender.user_id..'/'.. 'mute_ryple'},},{{text = 'تعطيل ردود المطور', data = msg.sender.user_id..'/'.. 'unmute_ryplesudo'},{text = 'تفعيل ردود المطور', data = msg.sender.user_id..'/'.. 'mute_ryplesudo'},},{{text = 'تعطيل الرفع', data = msg.sender.user_id..'/'.. 'unmute_setadmib'},{text = 'تفعيل الرفع', data = msg.sender.user_id..'/'.. 'mute_setadmib'},},{{text = 'تعطيل الطرد', data = msg.sender.user_id..'/'.. 'unmute_kickmembars'},{text = 'تفعيل الطرد', data = msg.sender.user_id..'/'.. 'mute_kickmembars'},},{{text = 'تعطيل الالعاب', data = msg.sender.user_id..'/'.. 'unmute_games'},{text = 'تفعيل الالعاب', data = msg.sender.user_id..'/'.. 'mute_games'},},{{text = 'تعطيل اطردني', data = msg.sender.user_id..'/'.. 'unmute_kickme'},{text = 'تفعيل اطردني', data = msg.sender.user_id..'/'.. 'mute_kickme'},},{{text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr'}},}}
return LuaTele.sendText(msg_chat_id, msg_id, '⌁ : اوامر التفعيل والتعطيل الخاصة بالمجموعة ↫ ⤈', 'md', false, false, false, false, reply_markup) end  
if text == 'اعدادات الحمايه' then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:get(itsspider.."spider:Status:Link"..msg.chat_id) then
Statuslink = '‹ ✓ ›' else Statuslink = '‹ ✗ ›'
end
if Redis:get(itsspider.."spider:Status:Welcome"..msg.chat_id) then
StatusWelcome = '‹ ✓ ›' else StatusWelcome = '‹ ✗ ›'
end
if Redis:get(itsspider.."spider:Status:Id"..msg.chat_id) then
StatusId = '‹ ✓ ›' else StatusId = '‹ ✗ ›'
end
if Redis:get(itsspider.."spider:Status:IdPhoto"..msg.chat_id) then
StatusIdPhoto = '‹ ✓ ›' else StatusIdPhoto = '‹ ✗ ›'
end
if Redis:get(itsspider.."spider:Status:Reply"..msg.chat_id) then
StatusReply = '‹ ✓ ›' else StatusReply = '‹ ✗ ›'
end
if Redis:get(itsspider.."spider:Status:ReplySudo"..msg.chat_id) then
StatusReplySudo = '‹ ✓ ›' else StatusReplySudo = '‹ ✗ ›'
end
if Redis:get(itsspider.."spider:Status:BanId"..msg.chat_id)  then
StatusBanId = '‹ ✓ ›' else StatusBanId = '‹ ✗ ›'
end
if Redis:get(itsspider.."spider:Status:SetId"..msg.chat_id) then
StatusSetId = '‹ ✓ ›' else StatusSetId = '‹ ✗ ›'
end
if Redis:get(itsspider.."spider:Status:Games"..msg.chat_id) then
StatusGames = '‹ ✓ ›' else StatusGames = '‹ ✗ ›'
end
if Redis:get(itsspider.."spider:Status:KickMe"..msg.chat_id) then
Statuskickme = '‹ ✓ ›' else Statuskickme = '‹ ✗ ›'
end
if Redis:get(itsspider.."spider:Status:AddMe"..msg.chat_id) then
StatusAddme = '‹ ✓ ›' else StatusAddme = '‹ ✗ ›'
end
local protectionGroup = '\n*⌁ : اعدادات حمايه المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n'
..'\n⌁ : جلب الرابط ↫ '..Statuslink
..'\n⌁ : جلب الترحيب ↫ '..StatusWelcome
..'\n⌁ : الايدي ↫ '..StatusId
..'\n⌁ : الايدي بالصوره ↫ '..StatusIdPhoto
..'\n⌁ : ردود المدير ↫ '..StatusReply
..'\n⌁ : ردود المطور ↫ '..StatusReplySudo
..'\n⌁ : الرفع ↫ '..StatusSetId
..'\n⌁ : الحظر - الطرد ↫ '..StatusBanId
..'\n⌁ : الالعاب ↫ '..StatusGames
..'\n⌁ : امر اطردني ↫ '..Statuskickme..'*\n\n'
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg_chat_id, msg_id,protectionGroup,'md', false, false, false, false, reply_markup) end
if text == "الاعدادات" then    
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Text = "*\n⌁ : اعدادات المجموعة ".."\n⌁ : علامة ال (✓) تعني مقفول".."\n⌁ : علامة ال (✗) تعني مفتوح*"
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = GetSetieng(msg_chat_id).lock_links, data = '&'},{text = 'الروابط : ', data =msg.sender.user_id..'/'.. 'Status_link'},},{{text = GetSetieng(msg_chat_id).lock_spam, data = '&'},{text = 'الكلايش : ', data =msg.sender.user_id..'/'.. 'Status_spam'},},{{text = GetSetieng(msg_chat_id).lock_inlin, data = '&'},{text = 'الكيبورد : ', data =msg.sender.user_id..'/'.. 'Status_keypord'},},{{text = GetSetieng(msg_chat_id).lock_vico, data = '&'},{text = 'الاغاني : ', data =msg.sender.user_id..'/'.. 'Status_voice'},},{{text = GetSetieng(msg_chat_id).lock_gif, data = '&'},{text = 'المتحركه : ', data =msg.sender.user_id..'/'.. 'Status_gif'},},{{text = GetSetieng(msg_chat_id).lock_file, data = '&'},{text = 'الملفات : ', data =msg.sender.user_id..'/'.. 'Status_files'},},{{text = GetSetieng(msg_chat_id).lock_text, data = '&'},{text = 'الدردشه : ', data =msg.sender.user_id..'/'.. 'Status_text'},},{{text = GetSetieng(msg_chat_id).lock_ved, data = '&'},{text = 'الفيديو : ', data =msg.sender.user_id..'/'.. 'Status_video'},},{{text = GetSetieng(msg_chat_id).lock_photo, data = '&'},{text = 'الصور : ', data =msg.sender.user_id..'/'.. 'Status_photo'},},{{text = GetSetieng(msg_chat_id).lock_user, data = '&'},{text = 'المعرفات : ', data =msg.sender.user_id..'/'.. 'Status_username'},},{{text = GetSetieng(msg_chat_id).lock_hash, data = '&'},{text = 'التاك : ', data =msg.sender.user_id..'/'.. 'Status_tags'},},{{text = GetSetieng(msg_chat_id).lock_bots, data = '&'},{text = 'البوتات : ', data =msg.sender.user_id..'/'.. 'Status_bots'},},{{text = 'التالي', data =msg.sender.user_id..'/'.. 'NextSeting'}},{{text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr'}},}}
return LuaTele.sendText(msg_chat_id, msg_id, Text, 'md', false, false, false, false, reply_markup) end  
if text == 'المجموعة' or text == 'المجموعه' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
local Get_Chat = LuaTele.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '‹ ✓ ›' else web = '‹ ✗ ›'
end
if Get_Chat.permissions.can_change_info then
info = '‹ ✓ ›' else info = '‹ ✗ ›'
end
if Get_Chat.permissions.can_invite_users then
invite = '‹ ✓ ›' else invite = '‹ ✗ ›'
end
if Get_Chat.permissions.can_pin_messages then
pin = '‹ ✓ ›' else pin = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_media_messages then
media = '‹ ✓ ›' else media = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_messages then
messges = '‹ ✓ ›' else messges = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_other_messages then
other = '‹ ✓ ›' else other = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_polls then
polls = '‹ ✓ ›' else polls = '‹ ✗ ›'
end
local permissions = '*\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n⌁ : صلاحيات المجموعة ↫ ⤈'..'\n⌁ : تغيير معلومات المجموعة : '..info..'\n⌁ : اضافه مستخدمين : '..invite..'\n⌁ : تثبيت الرسائل : '..pin..'\n⌁ : ارسال الميديا : '..media..'\n⌁ : ارسال الرسائل : '..messges..'\n⌁ : اضافه البوتات : '..other..'\n⌁ : ارسال الويب : '..web..'\n⌁ : ارسال استفتاء : '..polls..'*\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'
local TextChat = '*\n⌁ : معلومات المجموعة :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..' \n⌁ : عدد الادمنيه : ‹ '..Info_Chats.administrator_count..' ›\n⌁ : عدد المحظورين : ‹ '..Info_Chats.banned_count..' ›\n⌁ : عدد الاعضاء : ‹ '..Info_Chats.member_count..' ›\n⌁ : عدد المقيديين : ‹ '..Info_Chats.restricted_count..' ›\n⌁ : اسم المجموعة : ‹* ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ›*'
return LuaTele.sendText(msg_chat_id,msg_id, TextChat..permissions,"md",true) end
if text == 'صلاحيات المجموعة' or text == 'صلاحيات المجموعه' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local Get_Chat = LuaTele.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '‹ ✓ ›' else web = '‹ ✗ ›'
end
if Get_Chat.permissions.can_change_info then
info = '‹ ✓ ›' else info = '‹ ✗ ›'
end
if Get_Chat.permissions.can_invite_users then
invite = '‹ ✓ ›' else invite = '‹ ✗ ›'
end
if Get_Chat.permissions.can_pin_messages then
pin = '‹ ✓ ›' else pin = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_media_messages then
media = '‹ ✓ ›' else media = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_messages then
messges = '‹ ✓ ›' else messges = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_other_messages then
other = '‹ ✓ ›' else other = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_polls then
polls = '‹ ✓ ›' else polls = '‹ ✗ ›'
end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ' تغيير معلومات المجموعة : '..info, data =msg.sender.user_id..  '/info'},},{{text = ' اضافه مستخدمين : '..invite, data =msg.sender.user_id..  '/invite'},},{{text = ' تثبيت الرسائل : '..pin, data =msg.sender.user_id..  '/pin'},},{{text = ' ارسال الميديا : '..media, data =msg.sender.user_id..  '/media'},},{{text = ' ارسال الرسائل : '..messges, data =msg.sender.user_id..  '/messges'},},{{text = ' اضافه البوتات : '..other, data =msg.sender.user_id..  '/other'},},{{text = ' ارسال الويب : '..web, data = msg.sender.user_id..'/web'},},{{text = ' ارسال استفتاء : '..polls, data =msg.sender.user_id.. '/polls'},},{{text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. '/delAmr'}},}}
return LuaTele.sendText(msg_chat_id, msg_id, "⌁ : صلاحيات المجموعة ↫ ⤈", 'md', false, false, false, false, reply_markup) end
if text == 'تنزيل الكل' and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if Redis:sismember(itsspider.."spider:DevelopersAS:Groups",Message_Reply.sender.user_id) then
d = "المطورين الاساسيين • " else d = "" end
if Redis:sismember(itsspider.."spider:DevelopersQ:Groups",Message_Reply.sender.user_id) then
de = "المطورين الثانويين • " else de = "" end
if Redis:sismember(itsspider.."spider:Developers:Groups",Message_Reply.sender.user_id) then
dev = "المطورين • " else dev = "" end
if Redis:sismember(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id, Message_Reply.sender.user_id) then
mk = "المالكين • " else mk = "" end
if Redis:sismember(itsspider.."spider:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id) then
crr = "المنشئين الاساسيين • " else crr = "" end
if Redis:sismember(itsspider..'spider:Originators:Group'..msg_chat_id, Message_Reply.sender.user_id) then
cr = "المنشئين • " else cr = "" end
if Redis:sismember(itsspider..'spider:Managers:Group'..msg_chat_id, Message_Reply.sender.user_id) then
own = "المدراء • " else own = "" end
if Redis:sismember(itsspider..'spider:Addictive:Group'..msg_chat_id, Message_Reply.sender.user_id) then
mod = "الادمنيه • " else mod = "" end
if Redis:sismember(itsspider..'spider:Cleaner:Group'..msg_chat_id, Message_Reply.sender.user_id) then
Cle = "المنظفين • " else Cle = "" end
if Redis:sismember(itsspider..'spider:Distinguished:Group'..msg_chat_id, Message_Reply.sender.user_id) then
vip = "المميزين • " else vip = ""
end
if The_ControllerAll(Message_Reply.sender.user_id) == true then
Rink = 1
elseif Redis:sismember(itsspider.."spider:DevelopersAS:Groups",Message_Reply.sender.user_id)  then
Rink = 2
elseif Redis:sismember(itsspider.."spider:DevelopersQ:Groups",Message_Reply.sender.user_id)  then
Rink = 3
elseif Redis:sismember(itsspider.."spider:Developers:Groups",Message_Reply.sender.user_id)  then
Rink = 4
elseif Redis:sismember(itsspider.."spider:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 5
elseif Redis:sismember(itsspider.."spider:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 6
elseif Redis:sismember(itsspider.."spider:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 7
elseif Redis:sismember(itsspider.."spider:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 8
elseif Redis:sismember(itsspider.."spider:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 9
elseif Redis:sismember(itsspider.."spider:Cleaner:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 10
elseif Redis:sismember(itsspider.."spider:TheBas:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 11
elseif Redis:sismember(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 12
else
Rink = 13
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : ليس لديه اي رتبه هنا *","md",true)  end
if msg.ControllerBot then
if Rink == 1 or Rink < 1 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل المطور الاساسي*","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة*","md",true)  end
Redis:srem(itsspider.."spider:DevelopersAS:Groups",Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:DevelopersQ:Groups",Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Developers:Groups",Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Cleaner:Group"..msg_chat_id, Message_Reply.sender.user_id)
elseif msg.DevelopersAS then
if Rink == 2 or Rink < 2 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة*","md",true)  end
Redis:srem(itsspider.."spider:DevelopersQ:Groups",Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Developers:Groups",Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Cleaner:Group",Message_Reply.sender.user_id)
elseif msg.DevelopersQ then
if Rink == 3 or Rink < 3 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة*","md",true)  end
Redis:srem(itsspider.."spider:Developers:Groups",Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Cleaner:Group",Message_Reply.sender.user_id)
elseif msg.Developers then
if Rink == 4 or Rink < 4 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة*","md",true)  end
Redis:srem(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Cleaner:Group",Message_Reply.sender.user_id)
elseif msg.TheBasics then
if Rink == 5 or Rink < 5 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة*","md",true)  end
Redis:srem(itsspider.."spider:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Cleaner:Group",Message_Reply.sender.user_id)
elseif msg.Originators then
if Rink == 6 or Rink < 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة*","md",true)  end
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Cleaner:Group",Message_Reply.sender.user_id)
elseif msg.Managers then
if Rink == 7 or Rink < 7 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة*","md",true)  end
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
elseif msg.Addictive then
if Rink == 8 or Rink < 8 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة*","md",true)  end
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id) end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : تم تنزيله من ↫ ⤈\n ‹ "..d..""..de..""..dev..""..crr..""..cr..""..own..""..mod..""..vip..""..Cle..""..mk.." ›*","md",true)  end
if text and text:match('^تنزيل الكل @(%S+)$') then
local UserName = text:match('^تنزيل الكل @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if Redis:sismember(itsspider.."spider:DevelopersAS:Groups",UserId_Info.id) then
d = "المطورين الاساسيين • " else d = "" end
if Redis:sismember(itsspider.."spider:DevelopersQ:Groups",UserId_Info.id) then
de = "المطورين الثانويين • " else de = "" end
if Redis:sismember(itsspider.."spider:Developers:Groups",UserId_Info.id) then
dev = "المطورين • " else dev = "" end
if Redis:sismember(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id) then
mk = "المالكين • " else mk = "" end
if Redis:sismember(itsspider.."spider:TheBasics:Group"..msg_chat_id, UserId_Info.id) then
crr = "المنشئين الاساسيين • " else crr = "" end
if Redis:sismember(itsspider..'spider:Originators:Group'..msg_chat_id, UserId_Info.id) then
cr = "المنشئين • " else cr = "" end
if Redis:sismember(itsspider..'spider:Managers:Group'..msg_chat_id, UserId_Info.id) then
own = "المدراء • " else own = "" end
if Redis:sismember(itsspider..'spider:Addictive:Group'..msg_chat_id, UserId_Info.id) then
mod = "الادمنيه • " else mod = "" end
if Redis:sismember(itsspider..'spider:Cleaner:Group'..msg_chat_id, UserId_Info.id) then
Cle = "المنظفين • " else Cle = "" end
if Redis:sismember(itsspider..'spider:Distinguished:Group'..msg_chat_id, UserId_Info.id) then
vip = "المميزين • " else vip = ""
end
if The_ControllerAll(UserId_Info.id) == true then
Rink = 1
elseif Redis:sismember(itsspider.."spider:DevelopersAS:Groups",UserId_Info.id)  then
Rink = 2
elseif Redis:sismember(itsspider.."spider:DevelopersQ:Groups",UserId_Info.id)  then
Rink = 3
elseif Redis:sismember(itsspider.."spider:Developers:Groups",UserId_Info.id)  then
Rink = 4
elseif Redis:sismember(itsspider.."spider:TheBasics:Group"..msg_chat_id, UserId_Info.id) then
Rink = 5
elseif Redis:sismember(itsspider.."spider:Originators:Group"..msg_chat_id, UserId_Info.id) then
Rink = 6
elseif Redis:sismember(itsspider.."spider:Managers:Group"..msg_chat_id, UserId_Info.id) then
Rink = 7
elseif Redis:sismember(itsspider.."spider:Addictive:Group"..msg_chat_id, UserId_Info.id) then
Rink = 8
elseif Redis:sismember(itsspider.."spider:Distinguished:Group"..msg_chat_id, UserId_Info.id) then
Rink = 9
elseif Redis:sismember(itsspider.."spider:Cleaner:Group"..msg_chat_id, UserId_Info.id) then
Rink = 10
elseif Redis:sismember(itsspider.."spider:TheBas:Group"..msg_chat_id, UserId_Info.id) then
Rink = 11
elseif Redis:sismember(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id) then
Rink = 12
else
Rink = 13
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : ليس لديه اي رتبه هنا *","md",true)  end
if msg.ControllerBot then
if Rink == 1 or Rink < 1 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل المطور الاساسي *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(itsspider.."spider:DevelopersAS:Groups",UserId_Info.id)
Redis:srem(itsspider.."spider:DevelopersQ:Groups",UserId_Info.id)
Redis:srem(itsspider.."spider:Developers:Groups",UserId_Info.id)
Redis:srem(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Cleaner:Group"..msg_chat_id, UserId_Info.id)
elseif msg.DevelopersAS then
if Rink == 2 or Rink < 2 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(itsspider.."spider:DevelopersQ:Groups",UserId_Info.id)
Redis:srem(itsspider.."spider:Developers:Groups",UserId_Info.id)
Redis:srem(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Cleaner:Group",UserId_Info.id)
elseif msg.DevelopersQ then
if Rink == 3 or Rink < 3 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(itsspider.."spider:Developers:Groups",UserId_Info.id)
Redis:srem(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Cleaner:Group",UserId_Info.id)
elseif msg.Developers then
if Rink == 4 or Rink < 4 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Cleaner:Group",UserId_Info.id)
elseif msg.TheBasics then
if Rink == 5 or Rink < 5 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(itsspider.."spider:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Cleaner:Group",UserId_Info.id)
elseif msg.Originators then
if Rink == 6 or Rink < 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Cleaner:Group",UserId_Info.id)
elseif msg.Managers then
if Rink == 7 or Rink < 7 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Addictive then
if Rink == 8 or Rink < 8 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, UserId_Info.id) end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : تم تنزيله من ↫ ⤈\n ‹ "..d..""..de..""..dev..""..crr..""..cr..""..own..""..mod..""..vip..""..Cle..""..mk.." ›*","md",true)  end
if text and text:match('^تنزيل الكل (%d+)$') then
local UserId = text:match('^تنزيل الكل (%d+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserId_Info = LuaTele.getUser(UserId)
if UserId_Info.luatele == "error" and UserId_Info.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام ايدي خطأ ","md",true)  end
if UserId_Info.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserId_Info and UserId_Info.type and UserId_Info.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام الامر على البوت ","md",true)  end
if Redis:sismember(itsspider.."spider:DevelopersAS:Groups",UserId_Info.id) then
d = "المطورين الاساسيين • " else d = "" end
if Redis:sismember(itsspider.."spider:DevelopersQ:Groups",UserId_Info.id) then
de = "المطورين الثانويين • " else de = "" end
if Redis:sismember(itsspider.."spider:Developers:Groups",UserId_Info.id) then
dev = "المطورين • " else dev = "" end
if Redis:sismember(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id) then
mk = "المالكين • " else mk = "" end
if Redis:sismember(itsspider.."spider:TheBasics:Group"..msg_chat_id, UserId_Info.id) then
crr = "المنشئين الاساسيين • " else crr = "" end
if Redis:sismember(itsspider..'spider:Originators:Group'..msg_chat_id, UserId_Info.id) then
cr = "المنشئين • " else cr = "" end
if Redis:sismember(itsspider..'spider:Managers:Group'..msg_chat_id, UserId_Info.id) then
own = "المدراء • " else own = "" end
if Redis:sismember(itsspider..'spider:Addictive:Group'..msg_chat_id, UserId_Info.id) then
mod = "الادمنيه • " else mod = "" end
if Redis:sismember(itsspider..'spider:Cleaner:Group'..msg_chat_id, UserId_Info.id) then
Cle = "المنظفين • " else Cle = "" end
if Redis:sismember(itsspider..'spider:Distinguished:Group'..msg_chat_id, UserId_Info.id) then
vip = "المميزين • " else vip = ""
end
if The_ControllerAll(UserId_Info.id) == true then
Rink = 1
elseif Redis:sismember(itsspider.."spider:DevelopersAS:Groups",UserId_Info.id)  then
Rink = 2
elseif Redis:sismember(itsspider.."spider:DevelopersQ:Groups",UserId_Info.id)  then
Rink = 3
elseif Redis:sismember(itsspider.."spider:Developers:Groups",UserId_Info.id)  then
Rink = 4
elseif Redis:sismember(itsspider.."spider:TheBasics:Group"..msg_chat_id, UserId_Info.id) then
Rink = 5
elseif Redis:sismember(itsspider.."spider:Originators:Group"..msg_chat_id, UserId_Info.id) then
Rink = 6
elseif Redis:sismember(itsspider.."spider:Managers:Group"..msg_chat_id, UserId_Info.id) then
Rink = 7
elseif Redis:sismember(itsspider.."spider:Addictive:Group"..msg_chat_id, UserId_Info.id) then
Rink = 8
elseif Redis:sismember(itsspider.."spider:Distinguished:Group"..msg_chat_id, UserId_Info.id) then
Rink = 9
elseif Redis:sismember(itsspider.."spider:Cleaner:Group"..msg_chat_id, UserId_Info.id) then
Rink = 10
elseif Redis:sismember(itsspider.."spider:TheBas:Group"..msg_chat_id, UserId_Info.id) then
Rink = 11
elseif Redis:sismember(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id) then
Rink = 12
else
Rink = 13
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : ليس لديه اي رتبه هنا *","md",true)  end
if msg.ControllerBot then
if Rink == 1 or Rink < 1 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل المطور الاساسي *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(itsspider.."spider:DevelopersAS:Groups",UserId_Info.id)
Redis:srem(itsspider.."spider:DevelopersQ:Groups",UserId_Info.id)
Redis:srem(itsspider.."spider:Developers:Groups",UserId_Info.id)
Redis:srem(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Cleaner:Group"..msg_chat_id, UserId_Info.id)
elseif msg.DevelopersAS then
if Rink == 2 or Rink < 2 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(itsspider.."spider:DevelopersQ:Groups",UserId_Info.id)
Redis:srem(itsspider.."spider:Developers:Groups",UserId_Info.id)
Redis:srem(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Cleaner:Group",UserId_Info.id)
elseif msg.DevelopersQ then
if Rink == 3 or Rink < 3 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(itsspider.."spider:Developers:Groups",UserId_Info.id)
Redis:srem(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Cleaner:Group",UserId_Info.id)
elseif msg.Developers then
if Rink == 4 or Rink < 4 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Cleaner:Group",UserId_Info.id)
elseif msg.TheBasics then
if Rink == 5 or Rink < 5 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(itsspider.."spider:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Cleaner:Group",UserId_Info.id)
elseif msg.Originators then
if Rink == 6 or Rink < 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(itsspider.."spider:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Cleaner:Group",UserId_Info.id)
elseif msg.Managers then
if Rink == 7 or Rink < 7 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(itsspider.."spider:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Addictive then
if Rink == 8 or Rink < 8 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(itsspider.."spider:Distinguished:Group"..msg_chat_id, UserId_Info.id) end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : تم تنزيله من ↫ ⤈\n ‹ "..d..""..de..""..dev..""..crr..""..cr..""..own..""..mod..""..vip..""..Cle..""..mk.." ›*","md",true)  end
if text == ('رفع مشرف') and msg.reply_to_message_id ~= 0 then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).SetAdmin == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'administrator',{1 ,1, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, ''})
if SetAdmin.code == 3 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنني رفعه ليس لدي صلاحيات *","md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ تعديل الصلاحيات ›', data = msg.sender.user_id..'/groupNumseteng//'..Message_Reply.sender.user_id},},}}
return LuaTele.sendText(msg_chat_id, msg_id, "⌁ : يمكنك تعديل صلاحيات المستخدم", 'md', false, false, false, false, reply_markup) end
if text and text:match('^رفع مشرف @(%S+)$') then
local UserName = text:match('^رفع مشرف @(%S+)$')
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).SetAdmin == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{1 ,1, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, ''})
if SetAdmin.code == 3 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنني رفعه ليس لدي صلاحيات *","md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ تعديل الصلاحيات ›', data = msg.sender.user_id..'/groupNumseteng//'..UserId_Info.id},},}}
return LuaTele.sendText(msg_chat_id, msg_id, "⌁ : يمكنك تعديل صلاحيات المستخدم", 'md', false, false, false, false, reply_markup) end 
if text == ('تنزيل مشرف') and msg.reply_to_message_id ~= 0 then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).SetAdmin == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'administrator',{0 ,0, 0, 0, 0, 0, 0 ,0, 0})
if SetAdmin.code == 400 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لست انا من قام برفعه *","md",true)  end
if SetAdmin.code == 3 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنني تنزيله ليس لدي صلاحيات *","md",true)  end
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم تنزيله من المشرفين ").Reply,"md",true)  end
if text and text:match('^تنزيل مشرف @(%S+)$') then
local UserName = text:match('^تنزيل مشرف @(%S+)$')
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).SetAdmin == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{0 ,0, 0, 0, 0, 0, 0 ,0, 0})
if SetAdmin.code == 400 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لست انا من قام برفعه *","md",true)  end
if SetAdmin.code == 3 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا يمكنني تنزيله ليس لدي صلاحيات *","md",true)  end
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم تنزيله من المشرفين ").Reply,"md",true)  end 
if text == 'رسائلي' then
local OR33 = (Redis:get(itsspider..'spider:Num:Message:User'..msg.chat_id..':'..msg.sender.user_id) or 0)
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح رسائلي : '..OR33..' ›', data = msg.sender.user_id..'/MMsgDel'},},}}
LuaTele.sendText(msg_chat_id,msg_id,'⌁ : عدد رسائلك هنا ↫ ‹ *'..OR33..'* ›',"md",false ,false, false,false,reply_markup)  end
if text == 'سحكاتي' or text == 'تعديلاتي' then
local OR33 = (Redis:get(itsspider..'spider:Num:Message:Edit'..msg.chat_id..msg.sender.user_id) or 0)
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح سحكاتي : '..OR33..' ›', data = msg.sender.user_id..'/MsgDell'},},}}
LuaTele.sendText(msg_chat_id,msg_id,'⌁ : عدد التعديلات هنا ↫ ‹ *'..OR33..'* ›',"md",false, false, false,false, reply_markup)  end
if text == 'مسح جهاتي' then
Redis:del(itsspider..'spider:Num:Add:Memp'..msg.chat_id..msg.sender.user_id)
LuaTele.sendText(msg_chat_id,msg_id,'⌁ : تم مسح جميع جهاتك المضافه ',"md",true)  
elseif text == 'جهاتي' then
LuaTele.sendText(msg_chat_id,msg_id,'⌁ : عدد جهاتك المضافه هنا ↫ ‹ *'..(Redis:get(itsspider.."spider:Num:Add:Memp"..msg.chat_id..":"..msg.sender.user_id) or 0)..'* ›',"md",true)  
elseif text == 'مسح' and msg.reply_to_message_id ~= 0 and msg.Addictive then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if GetInfoBot(msg).Delmsg == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  end
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.reply_to_message_id})
LuaTele.deleteMessages(msg.chat_id,{[1]= msg_id}) end
if text == 'تعين الايدي عام' or text == 'تغير الايدي عام' or text == 'وضع الايدي عام' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(itsspider.."spider:Set:Id:Groups"..msg.chat_id..""..msg.sender.user_id,240,true)  
return LuaTele.sendText(msg_chat_id,msg_id,[[
⌁ : ارسل الان النص
⌁ : يمكنك اضافه :
⌁ : `#username` ↫ اسم المستخدم
⌁ : `#msgs` ↫ عدد الرسائل
⌁ : `#photos` ↫ عدد الصور
⌁ : `#id` ↫ ايدي المستخدم
⌁ : `#auto` ↫ نسبة التفاعل
⌁ : `#stast` ↫ رتبة المستخدم 
⌁ : `#edit` ↫ عدد السحكات
⌁ : `#game` ↫ عدد المجوهرات
⌁ : `#AddMem` ↫ عدد الجهات
⌁ : `#Description` ↫ تعليق الصوره
]],"md",true)    
end 


if text == 'حذف الايدي عام' or text == 'مسح الايدي عام' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Set:Id:Groups")
return LuaTele.sendText(msg_chat_id,msg_id, '⌁ : تم ازالة كليشة الايدي العامه',"md",true)  end
if text == 'تعين الايدي' or text == 'تعيين الايدي' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(itsspider.."spider:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id,240,true)  
return LuaTele.sendText(msg_chat_id,msg_id,[[
⌁ : ارسل الان النص
⌁ : يمكنك اضافه :
⌁ : `#username` ↫ اسم المستخدم
⌁ : `#msgs` ↫ عدد الرسائل
⌁ : `#photos` ↫ عدد الصور
⌁ : `#id` ↫ ايدي المستخدم
⌁ : `#auto` ↫ نسبة التفاعل
⌁ : `#stast` ↫ رتبة المستخدم 
⌁ : `#edit` ↫ عدد السحكات
⌁ : `#game` ↫ عدد المجوهرات
⌁ : `#AddMem` ↫ عدد الجهات
⌁ : `#Description` ↫ تعليق الصوره
]],"md",true)    
end 
if text == 'حذف الايدي' or text == 'مسح الايدي' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Set:Id:Group"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id, '⌁ : تم ازالة كليشة الايدي ',"md",true)  end
if text and text:match("^مسح (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^مسح (.*)$")
if TextMsg == 'المطورين الاساسين' or TextMsg == 'المطورين الاساسيين' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:DevelopersAS:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مطورين اساسيين حالياً , ","md",true)  end
Redis:del(itsspider.."spider:DevelopersAS:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من المطورين اساسيين*","md",true) end
if TextMsg == 'المطورين الثانوين' or TextMsg == 'المطورين الثانويين' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:DevelopersQ:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مطورين ثانويين حالياً , ","md",true)  end
Redis:del(itsspider.."spider:DevelopersQ:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من المطورين الثانويين*","md",true) end
if TextMsg == 'المطورين' then
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:Developers:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مطورين حالياً , ","md",true)  end
Redis:del(itsspider.."spider:Developers:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من المطورين *","md",true) end
if TextMsg == 'المالكين' then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مالكين في البوت ","md",true)  end
Redis:del(itsspider.."spider:TheBasicsQ:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من المالكين *","md",true) end
if TextMsg == 'المنشئين الاساسيين' or TextMsg == 'المنشئين الاساسين' then
if LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele ~= "chatMemberStatusCreator" or not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر المالكين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:TheBasics:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد منشئين اساسيين حالياً , ","md",true)  end
Redis:del(itsspider.."spider:TheBasics:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من المنشؤين الاساسيين *","md",true) end
if TextMsg == 'المنشئين' then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:Originators:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد منشئين حالياً , ","md",true)  end
Redis:del(itsspider.."spider:Originators:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من المنشئين *","md",true) end
if TextMsg == 'المدراء' then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:Managers:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مدراء حالياً , ","md",true)  end
Redis:del(itsspider.."spider:Managers:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من المدراء *","md",true) end
if TextMsg == 'الادمنيه' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:Addictive:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد ادمنيه حالياً , ","md",true)  end
Redis:del(itsspider.."spider:Addictive:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من الادمنيه *","md",true) end
if TextMsg == 'المنظفين' then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:Cleaner:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد منظفين حالياً , ","md",true)  end
Redis:del(itsspider.."spider:Cleaner:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من المنظفين *","md",true) end
if TextMsg == 'المميزين' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:Distinguished:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مميزين حالياً , ","md",true)  end
Redis:del(itsspider.."spider:Distinguished:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من المميزين *","md",true) end
if TextMsg == 'قائمة عام' or TextMsg == 'قائمة العام' or TextMsg == 'قائمه عام' or TextMsg == 'قائمه العام' then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:BanAll:Groups") 
local Info_Memberss = Redis:smembers(itsspider.."spider:ktmAll:Groups") 
if #Info_Members == 0 and #Info_Memberss == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد ( مكتومين • محظورين ) عام حالياً","md",true)  end
Redis:del(itsspider.."spider:BanAll:Groups") 
Redis:del(itsspider.."spider:ktmAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من محظورين العام*\n*⌁ : تم مسح ‹ "..#Info_Memberss.." › من المكتومين العام *","md",true) end
if TextMsg == 'المحظورين عام' or TextMsg == 'المحظورين العام' then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:BanAll:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد محظورين عام حالياً , ","md",true)  end
Redis:del(itsspider.."spider:BanAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من المحظورين عام *","md",true) end
if TextMsg == 'المكتومين عام' or TextMsg == 'المكتومين العام' then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:ktmAll:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مكتومين عام حالياً , ","md",true)  end
Redis:del(itsspider.."spider:ktmAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من المكتومين عام *","md",true) end
if TextMsg == 'المحظورين' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:BanGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد محظورين حالياً , ","md",true)  end
Redis:del(itsspider.."spider:BanGroup:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من المحظورين *","md",true) end
if TextMsg == 'المكتومين' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:SilentGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مكتومين حالياً , ","md",true)  end
Redis:del(itsspider.."spider:SilentGroup:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من المكتومين *","md",true) end
if TextMsg == 'المقيدين' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Recent", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.luatele == "chatMemberStatusRestricted" then
LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{1,1,1,1,1,1,1,1})
x = x + 1 end end
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..x.." › من المقيديين *","md",true) end
if TextMsg == 'البوتات' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
local Ban_Bots = LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if Ban_Bots.luatele == "ok" then
x = x + 1 end end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عدد البوتات الموجوده : "..#List_Members.."\n⌁ : تم طرد ‹ "..x.." › بوت من المجموعة *","md",true)  end
if TextMsg == 'المطرودين' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Banned", "*", 0, 200)
x = 0
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
UNBan_Bots = LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
if UNBan_Bots.luatele == "ok" then
x = x + 1 end end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عدد المطرودين في المجموعة ↫ ‹ "..#List_Members.." ›\n⌁ : تم الغاء الحظر عن ‹ "..x.." › من الاشخاص*","md",true)  end
if TextMsg == 'المحذوفين' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.type.luatele == "userTypeDeleted" then
local userTypeDeleted = LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if userTypeDeleted.luatele == "ok" then
x = x + 1 end end
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : تم طرد ‹ "..x.." › حساب محذوف *","md",true) end end
-- OR33 --
if text == ("عرض الردود") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local R = Redis:scard(itsspider.."spider1:List:Rd:Sudo"..msg.chat_id)
local RR = Redis:scard(itsspider.."spider:List:Manager"..msg_chat_id.."")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ ردود المدير : '..RR..' ›', data = msg.sender.user_id..'/RRD'},},{{text = '‹ الردود المتعدده : '..R..' ›', data = msg.sender.user_id..'/RdOR33'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, "⌁ : اختر نوع الردود لعرضها في المجموعة ↫ ⤈", 'md', false, false, false, false, reply_markup) end
--
if text == ("مسح الردود") or text == ("حذف الردود") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local R = Redis:scard(itsspider.."spider1:List:Rd:Sudo"..msg.chat_id)
local RR = Redis:scard(itsspider.."spider:List:Manager"..msg_chat_id.."")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ ردود المدير : '..RR..' ›', data = msg.sender.user_id..'/RD'},},{{text = '‹ الردود المتعدده : '..R..' ›', data = msg.sender.user_id..'/RdOR33'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, "⌁ : اختر نوع الردود لحذفها من المجموعة ↫ ⤈", 'md', false, false, false, false, reply_markup) end
--
if text == ("الردود المتعدده") or text == ("مسح الردود المتعدده") or text == ("حذف الردود المتعدده") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local R = Redis:scard(itsspider.."spider1:List:Rd:Sudo"..msg.chat_id)
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ حذف الردود : '..R..' ›', data = msg.sender.user_id..'/RdOR33'},{text = '‹ عرض الردود : '..R..' ›', data = msg.sender.user_id..'/RdOR33'},},{{text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr'}},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, "⌁ : من خلال الازرار يمكن عرض وحذف الردود ↫ ⤈", 'md', false, false, false, false, reply_markup) end
--
if text == ("ردود المدير") or text == ("مسح ردود المدير") or text == ("حذف ردود المدير") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local R = Redis:scard(itsspider.."spider:List:Manager"..msg_chat_id.."")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ حذف الردود : '..R..' ›', data = msg.sender.user_id..'/RD'},{text = '‹ عرض الردود : '..R..' ›', data = msg.sender.user_id..'/RRD'},},{{text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr'}},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, "⌁ : من خلال الازرار يمكن عرض وحذف الردود ↫ ⤈", 'md', false, false, false, false, reply_markup) end
-- OR33 --
if text == "اضف رد" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closeRD'},},}}
Redis:set(itsspider.."spider:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل الان الكلمه لاضافتها في ردود المدير ","md",false ,false, false, false, reply_markup)  end
if text == "حذف رد" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/OR33close'},},}}
Redis:set(itsspider.."spider:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id,"true2")
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل الان الكلمه لحذفها من ردود المدير","md",false, false, false, false, reply_markup) end
-- OR33 --
if text == ("الردود المتعدده العامه") or text == ("مسح الردود المتعدده العامه") or text == ("حذف الردود المتعدده العامه") then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local R = Redis:scard(itsspider.."spider11:List:Rd:Sudo")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ حذف الردود : '..R..' ›', data = msg.sender.user_id..'/RSoOR33'},{text = '‹ عرض الردود : '..R..' ›', data = msg.sender.user_id..'/RSoOR33'},},{{text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr'}},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, "⌁ : من خلال الازرار يمكن عرض وحذف الردود ↫ ⤈", 'md', false, false, false, false, reply_markup) end
--
if text == ("ردود المطور") or text == ("مسح الردود العامه") or text == ("حذف الردود العامه") then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local R = Redis:scard(itsspider.."spider:List:Rd:Sudo")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ حذف الردود : '..R..' ›', data = msg.sender.user_id..'/RDs'},{text = '‹ عرض الردود : '..R..' ›', data = msg.sender.user_id..'/RRDs'},},{{text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr'}},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, "⌁ : من خلال الازرار يمكن عرض وحذف الردود ↫ ⤈", 'md', false, false, false, false, reply_markup) end
--
if text == ("اوامر التسليه") then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local R = Redis:scard(itsspider.."spider:List:Rd:Sudo")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ غنيلي ›', data = msg.sender.user_id..'/Song'},},{{text = '‹ شعر ›', data = msg.sender.user_id..'/voice'},{text = '‹ اغنيه ›', data = msg.sender.user_id..'/Mp'},},{{text = '‹ ميمز ›', data = msg.sender.user_id..'/Memz'},{text = '‹ ريمكس ›', data = msg.sender.user_id..'/Remix'},},{{text = '‹ انمي ›', data = msg.sender.user_id..'/Anime'},{text = '‹ صوره ›', data = msg.sender.user_id..'/Photos'},},{{text = '‹ مسلسل ›', data = msg.sender.user_id..'/Series'},{text = '‹ فلم ›', data = msg.sender.user_id..'/Movies'},},{{text = '‹ متحركه ›', data = msg.sender.user_id..'/animation'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, "⌁ : يمكنك اختيار أحد اوامر التسليه ↫ ⤈", 'md', false, false, false, false, reply_markup) end
-- OR33 --
if text == "اضف رد للكل" or text == "اضف رد عام" then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Set:Rd"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل الان الكلمه لاضافتها في ردود المطور ","md",true)  end
if text == "حذف رد للكل" or text == "حذف رد عام" or text == "مسح رد عام" or text == "مسح رد للكل" then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/OR33closeSo'},},}}
Redis:set(itsspider.."spider:Set:On"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل الان الكلمه لحذفها من ردود المطور","md",false, false, false, false, reply_markup) end
if text=="اذاعه خاص" or text=="اذاعة خاص" then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(itsspider.."spider:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
⌁ : ارسل لي سواء كان 
‹ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه • صوت • رساله ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : للخروج ارسل ↫ ‹ الغاء ›
 ✓
]],"md",true)  
return false end
if text=="اذاعه" or text=="اذاعة" then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(itsspider.."spider:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
⌁ : ارسل لي سواء كان 
‹ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه • صوت • رساله ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : للخروج ارسل ↫ ‹ الغاء ›
 ✓
]],"md",true)  
return false end
if text=="اذاعه بالتثبيت" or text=="اذاعة بالتثبيت"then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(itsspider.."spider:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
⌁ : ارسل لي سواء كان 
‹ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه • صوت • رساله ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : للخروج ارسل ↫ ‹ الغاء ›
 ✓
]],"md",true)  
return false end
if text=="اذاعه بالتوجيه" or text=="اذاعة بالتوجيه"then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(itsspider.."spider:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل لي التوجيه الان\n⌁ : ليتم نشره في المجموعات","md",true)  
return false end
if text=="اذاعه خاص بالتوجيه" or text=="اذاعة خاص بالتوجيه" then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(itsspider.."spider:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل لي التوجيه الان\n⌁ : ليتم نشره الى المشتركين","md",true)  
return false end
if text == 'كشف القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,Message_Reply.sender.user_id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).ktmAll == true then
ktmAll = 'مكتوم عام'
else
ktmAll = 'غير مكتوم عام'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : معلومات الكشف ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"..'\n⌁ : الحظر العام ↫ '..BanAll..'\n⌁ : الكتم العام ↫ '..ktmAll..'\n⌁ : الحظر ↫ '..BanGroup..'\n⌁ : الكتم ↫ '..SilentGroup..'\n⌁ : التقييد ↫ '..Restricted..'*',"md",true)  end
if text and text:match('^كشف القيود @(%S+)$') then
local UserName = text:match('^كشف القيود @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,UserId_Info.id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).ktmAll == true then
ktmAll = 'مكتوم عام'
else
ktmAll = 'غير مكتوم عام'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : معلومات الكشف ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"..'\n⌁ : الحظر العام ↫ '..BanAll..'\n⌁ : الكتم العام ↫ '..ktmAll..'\n⌁ : الحظر ↫ '..BanGroup..'\n⌁ : الكتم ↫ '..SilentGroup..'\n⌁ : التقييد ↫ '..Restricted..'*',"md",true)  end
if text == 'رفع القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,Message_Reply.sender.user_id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanAll == true and msg.DevelopersAS then
BanAll = 'محظور عام ,'
Redis:srem(itsspider.."spider:BanAll:Groups",Message_Reply.sender.user_id) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).ktmAll == true and msg.DevelopersAS then
ktmAll = 'مكتوم عام ,'
Redis:srem(itsspider.."spider:ktmAll:Groups",Message_Reply.sender.user_id) 
else
ktmAll = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(itsspider.."spider:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(itsspider.."spider:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
else
SilentGroup = ''
end
LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : تم رفع القيود عنه ↫ ‹ "..BanAll..ktmAll..BanGroup..SilentGroup..Restricted..' ›*',"md",true)  end
if text and text:match('^رفع القيود @(%S+)$') then
local UserName = text:match('^رفع القيود @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,UserId_Info.id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true and msg.DevelopersAS then
BanAll = 'محظور عام ,'
Redis:srem(itsspider.."spider:BanAll:Groups",UserId_Info.id) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).ktmAll == true and msg.DevelopersAS then
ktmAll = 'مكتوم عام ,'
Redis:srem(itsspider.."spider:ktmAll:Groups",UserId_Info.id) 
else
ktmAll = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(itsspider.."spider:BanGroup:Group"..msg_chat_id,UserId_Info.id) 
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(itsspider.."spider:SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
else
SilentGroup = ''
end
LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : تم رفع القيود عنه ↫ ‹ "..BanAll..ktmAll..BanGroup..SilentGroup..Restricted..' ›*',"md",true)  end
-- OR33
if text == 'وضع كليشه المنشئ' or text == 'وضع كليشة المنشئ' or text == 'تغيير كليشة المنشئ' or text == 'تغيير كليشه المنشئ' then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember ~= "chatMemberStatusCreator") then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : هذا الامر لمالك المجموعة فقط !*","md",true)  
else
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/DelOwner'},},}}
Redis:set(itsspider..'spider:GetOwner:Ownerspider'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل لي كليشة المنشئ الان\n⌁ : ايضاً يمكنك استخدام ما يلي ↫ ⤈\n⌁ : دالة عرض الاسم ↫ ‹ `OwnName` ›\n⌁ : دالة عرض الايدي ↫ ‹ `OwniD` ›\n⌁ : دالة عرض المعرف ↫ ‹ `OwnUser` ›\n⌁ : دالة عرض البايو ↫ ‹ `OwnBio` ›\n⌁ : دالة عرض اسم المجموعة ↫ ‹ `NameGr` ›","md",false, false, false, false, reply_markup) end end
--
if text == 'مسح كليشة المنشئ' or text == 'حذف كليشة المنشئ' or text == 'مسح كليشه المنشئ' or text == 'حذف كليشه المنشئ' then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember ~= "chatMemberStatusCreator") then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : هذا الامر لمالك المجموعة فقط !*","md",true)
else
Redis:del(itsspider..'spider:Owner:Ownerspider'..msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : تم حذف كليشة المنشئ') end end
--
if text == 'وضع كليشه المطور' or text == 'وضع كليشة المطور' or text == 'تغيير كليشة المطور' or text == 'تغيير كليشه المطور' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/DelDev'},},}}
Redis:set(itsspider..'spider:GetTexting:Devspider'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل لي كليشة المطور الان\n⌁ : ايضاً يمكنك استخدام ما يلي ↫ ⤈\n⌁ : دالة عرض الاسم ↫ ‹ `DevName` ›\n⌁ : دالة عرض الايدي ↫ ‹ `DeviD` ›\n⌁ : دالة عرض المعرف ↫ ‹ `DevUser` ›\n⌁ : دالة عرض البايو ↫ ‹ `DevBio` ›\n⌁ : دالة عرض اسم المجموعة ↫ ‹ `NameGr` ›","md",false, false, false, false, reply_markup) end
--
if text == 'مسح كليشة المطور' or text == 'حذف كليشة المطور' or text == 'مسح كليشه المطور' or text == 'حذف كليشه المطور' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider..'spider:Texting:Devspider')
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : تم حذف كليشة المطور') end
if text == 'المطور' or text == 'مطور' then   
local UserInfo = LuaTele.getUser(Sudo_Id) 
local InfoUser = LuaTele.getUserFullInfo(Sudo_Id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local photo = LuaTele.getUserProfilePhotos(Sudo_Id)
if photo.total_count > 0 then
local TestText = "  ❲ Developers Source ❳\n— — — — — — — — —\n •︙*Dev Name* :  ["..UserInfo.first_name.."](tg://user?id="..Sudo_Id..")\n•︙*Dev User*: [❲ @"..UserSudo.." ❳]\n•︙*Dev Bio* : [❲ "..Bio.." ❳]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = "❲"..UserInfo.first_name.."❳", url = "https://t.me/"..UserSudo..""}
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local TestText = "  ❲ Developers Source ❳\n— — — — — — — — —\n •︙*Dev Name* :  ["..UserInfo.first_name.."](tg://user?id="..Sudo_Id..")\n•︙*Dev User*: [❲ @"..UserSudo.." ❳]\n•︙*Dev Bio* : [❲ "..Bio.." ❳]"
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown")
end
end
if text == "جمالي" or text == 'نسبه جمالي' or text == 'نسبة جمالي' then
if Redis:get(itsspider.."spider:Status:gamle"..msg.chat_id) then
local photo = LuaTele.getUserProfilePhotos(msg.sender.user_id)
if msg.Developers then
if photo.total_count > 0 then return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,"*نسبه جمالك هي 900% عشان مطور لازم اضبطك*", "md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*⌁ : لا توجد صوره في حسابك*',"md",true) 
end
else
if photo.total_count > 0 then
local nspp = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",}
local rdbhoto = nspp[math.random(#nspp)]
return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,"*نسبه جمالك هي "..rdbhoto.."% *", "md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*⌁ : لا توجد صوره في حسابك*',"md",true)  end end end end
if text and text:match("^كول (.*)$")then
local m = text:match("^كول (.*)$")
if Redis:get(itsspider.."spider:Status:kool"..msg.chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,m,"md",true)  end end
if text == "صورتي" then
if Redis:get(itsspider.."spider:Status:photo"..msg.chat_id) then
local photo = LuaTele.getUserProfilePhotos(msg.sender.user_id)
if photo.total_count > 0 then return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,"*⌁ : عدد صورك هو "..photo.total_count.." صوره*", "md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*⌁ : لا توجد صوره في حسابك*',"md",true) 
end
else
return LuaTele.sendText(msg_chat_id,msg_id,'*⌁ : امر صورتي معطل*',"md",true)  end end
if text == "بوت الزخرفه" or text == "اريد بوت زخرفه" or text == "بوت زخرفه" or text == "بوت الزغرفه" or text == "اريد بوت زغرفه" or text == "بوت زغرفه" then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ اضغط هنا ›', url = 't.me/zazhbot'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'*⌁ : اضغط للحصول على بوت الزخرفه*',"md",false, false, false, false, reply_markup) end
if text == "بوت كت تويت" or text == "بوت الكت" or text == "بوت كت" then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ اضغط هنا ›', url = 't.me/YEWEBOT'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'*⌁ : اضغط للحصول على بوت الكت*',"md",false, false, false, false, reply_markup) end
if text == "اهمس" or text == "بوت همسه" or text == "بوت الهمسه" or text == "همسه" or text == "اريد همسه" or text == "همسولي" or text == "اهمسلي" then return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : @NYrBot *',"md",true)  end
if text == 'رابط الحذف' or text == 'بوت الحذف' or text == 'بوت حذف' or text == 'رابط حذف' then
local tt =[[
⌁ : Deletion link in all social media .
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ Delete Bot ›', url = "https://t.me/R3J3BOT"}},{{text = '‹ Telegram', url = "https://my.telegram.org/auth?to=delete"},{text = 'Instagram ›', url = "https://www.instagram.com/accounts/login/?next=/accounts/remove/request/permanent/"}},{{text = '‹ Facebook', url = "https://www.facebook.com/help/deleteaccount"},{text = 'Snapchat ›', url = "https://accounts.snapchat.com/accounts/login?continue=https%3A%2F%2Faccounts.snapchat.com%2Faccounts%2Fdeleteaccount"}},{{text = '‹ 𝖲𝗈??𝗋𝖼𝖾 𝗄𝖺𝖽𝗂 ›', url = "https://t.me/wwttw"}}}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo=https://t.me/R3J3BOT&caption=".. URL.escape(tt).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) end
if text == 'السورس' or text == 'سورس' or text == 'ياسورس' or text == 'يا سورس' then  

local Text =[[



- 𝗐ᴇʟᴄᴏ𝗆𝖾 ᴛᴏ 𝗌𝗈𝗎𝗋𝖼𝖾 Forx .



]]

keyboard = {} 

keyboard.inline_keyboard = {

{

{text = '❲Source Channel❳', url = "https://t.me/wwttw"},{text = '❲Exp Source❳', url = "https://t.me/FoRx_TeAm"}

},

{

{text = '❲Developer❳', url = "https://t.me/NNUUU"}

},

{

{text = '❲Tws FoRx❳', url = "https://t.me/Fotx7bot"}

},

}

local msg_id = msg.id/2097152/0.5

https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/FoRx_TeAm/4&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))

end
if text == 'الاوامر' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اوامر الحمايه', data = msg.sender.user_id..'/help1'}, {text = ' اوامر الادمنيه', data = msg.sender.user_id..'/help2'},},{{text = 'اوامر المدراء', data = msg.sender.user_id..'/help3'}, {text = 'اوامر المنشئين', data = msg.sender.user_id..'/help4'},},{{text = 'اوامر المطورين', data = msg.sender.user_id..'/help5'}, {text = 'العاب البوت', data = msg.sender.user_id..'/help6'},},{{text = 'القفل والفتح', data = msg.sender.user_id..'/NoNextSeting'}, {text = 'التفعيل والتعطيل', data = msg.sender.user_id..'/listallAddorrem'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, [[*
⌁ : اهلا بك في قائمة الاوامر ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : م1 ↫ اوامر الحمايه
⌁ : م2 ↫ اوامر الادمنيه
⌁ : م3 ↫ اوامر المدراء
⌁ : م4 ↫ اوامر المنشئين
⌁ : م5 ↫ اوامر المطورين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
*]],"md",false, false, false, false, reply_markup)
elseif text == 'مسح الرتب' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر المالكين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح الاساسين ›', data = msg.sender.user_id..'/TheBasics'},},{{text = '‹ مسح المنشئين ›', data = msg.sender.user_id..'/Originators'},{text = '‹ مسح المدراء ›', data = msg.sender.user_id..'/Managers'},},{{text = '‹ مسح الادمنيه ›', data = msg.sender.user_id..'/Addictive'},{text = '‹ مسح المميزين ›', data = msg.sender.user_id..'/DelDistinguished'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : هلا بك في قسم رتب المجموعة',"md",false, false, false, false, reply_markup)
-- OR33 --
elseif text == 'عرض الرتب' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر المالكين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local L = Redis:scard(itsspider.."spider:TheBasics:Group"..msg_chat_id) 
local LL = Redis:scard(itsspider.."spider:Originators:Group"..msg_chat_id) 
local LLL = Redis:scard(itsspider.."spider:Managers:Group"..msg_chat_id)
local LLLL = Redis:scard(itsspider.."spider:Addictive:Group"..msg_chat_id)  
local LLLLL = Redis:scard(itsspider.."spider:Distinguished:Group"..msg_chat_id)
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الاساسيين : '..L..' ›', data = msg.sender.user_id..'/TheBasicsOR33'},},{{text = '‹ المنشئين : '..LL..' ›', data = msg.sender.user_id..'/OriginatorsOR33'},{text = '‹ المدراء : '..LLL..' ›', data = msg.sender.user_id..'/ManagersOR33'},},{{text = '‹ الادمنيه : '..LLLL..' ›', data = msg.sender.user_id..'/AddictiveOR33'},{text = '‹ المميزين : '..LLLLL..' ›', data = msg.sender.user_id..'/DelDistinguishedOR33'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : هلا بك في قسم رتب المجموعة',"md",false, false, false, false, reply_markup)
--
elseif text == 'تاك' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local L = Redis:scard(itsspider.."spider:TheBasics:Group"..msg_chat_id) 
local LL = Redis:scard(itsspider.."spider:Originators:Group"..msg_chat_id) 
local LLL = Redis:scard(itsspider.."spider:Managers:Group"..msg_chat_id)
local LLLL = Redis:scard(itsspider.."spider:Addictive:Group"..msg_chat_id)  
local LLLLL = Redis:scard(itsspider.."spider:Distinguished:Group"..msg_chat_id)
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الاساسيين : '..L..' ›', data = msg.sender.user_id..'/TheBasicsOR33'},},{{text = '‹ المنشئين : '..LL..' ›', data = msg.sender.user_id..'/OriginatorsOR33'},{text = '‹ المدراء : '..LLL..' ›', data = msg.sender.user_id..'/ManagersOR33'},},{{text = '‹ الادمنيه : '..LLLL..' ›', data = msg.sender.user_id..'/AddictiveOR33'},{text = '‹ المميزين : '..LLLLL..' ›', data = msg.sender.user_id..'/DelDistinguishedOR33'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'⌔︙اهلا بك يمكنك عمل تاك لي جميع رتب المجموعه',"md",false, false, false, false, reply_markup)
--
elseif text == 'مسح رسائلي' or text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local OR33 = (Redis:get(itsspider..'spider:Num:Message:Edit'..msg.chat_id..msg.sender.user_id) or 0)
local OR33 = (Redis:get(itsspider..'spider:Num:Message:User'..msg.chat_id..':'..msg.sender.user_id) or 0)
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح سحكاتي : '..OR33..' ›', data = msg.sender.user_id..'/MsgDell'},{text = '‹ مسح رسائلي : '..OR33..' ›', data = msg.sender.user_id..'/MMsgDel'},},{{text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr'}},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : من خلال الازرار يمكنك مسح رسائلك وسحكاتك',"md",false, false, false, false, reply_markup)
-- OR33 --
elseif text == 'م1' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ قائمة الاوامر ›', data = msg.sender.user_id..'/help1'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : اوامر الحمايه اتبع مايلي \n...— — — — — — — — —\n⌁ : قفل ، فتح ← الامر \n⌁ : تستطيع قفل حمايه كما يلي ...\n⌁ : ← { بالتقيد ، بالطرد ، بالكتم }\n— — — — — — — — —\n⌁ : الروابط\n⌁ : المعرف\n⌁ : التاك\n⌁ : الشارحه\n⌁ : التعديل\n⌁ : التثبيت\n⌁ : المتحركه\n⌁ : الملفات\n⌁ : الصور\n— — — — — — — — —\n⌁ : الماركداون\n⌁ : البوتات\n⌁ : التكرار\n⌁ : الكلايش\n⌁ : السيلفي\n⌁ : الملصقات\n⌁ : الفيديو\n⌁ : الانلاين\n⌁ : الدردشه\n— — — — — — — — —\n⌁ : التوجيه\n⌁ : الاغاني\n⌁ : الصوت\n⌁ : الجهات\n︙الاشعارات',"md",false, false, false, false, reply_markup)
elseif text == 'م2' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ قائمة الاوامر ›', data = msg.sender.user_id..'/help1'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : اوامر ادمنية المجموعه ...\n— — — — — — — — —\n⌁ : رفع، تنزيل ← مميز\n⌁ : تاك للكل ، عدد الكروب\n⌁ : كتم ، حظر ، طرد ، تقيد\n⌁ : الغاء كتم ، الغاء حظر ، الغاء تقيد\n⌁ : منع ، الغاء منع \n— — — — — — — — —\n⌁ : عرض القوائم كما يلي ...\n— — — — — — — — —\n⌁ : المكتومين\n⌁ : المميزين \n⌁ : قائمه المنع\n— — — — — — — — —\n⌁ : تثبيت ، الغاء تثبيت\n⌁ : الرابط ، الاعدادات\n⌁ : الترحيب ، القوانين\n⌁ : تفعيل ، تعطيل ← الترحيب\n⌁ : تفعيل ، تعطيل ← الرابط\n⌁ : جهاتي ،ايدي ، رسائلي\n⌁ : سحكاتي ، مجوهراتي\n⌁ : كشف البوتات\n— — — — — — — — —\n⌁ : وضع ، ضع ← الاوامر التاليه \n⌁ : اسم ، رابط ، صوره\n⌁ : قوانين ، وصف ، ترحيب\n— — — — — — — — —\n⌁ : حذف ، مسح ← الاوامر التاليه\n⌁ : قائمه المنع ، المحظورين \n⌁ : المميزين ، المكتومين ، القوانين\n⌁ : المطرودين ، البوتات ، الصوره\n⌁ : الرابط',"md",false, false, false, false, reply_markup)
elseif text == 'م3' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ قائمة الاوامر ›', data = msg.sender.user_id..'/help1'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : اوامر المدراء ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁ : فحص البوت\n⌁ : ضع اسم + الاسم\n⌁ : اضف • حذف ↫ رد\n⌁ : ردود المدير\n⌁ : حذف ردود المدير\n⌁ : اضف • حذف ↫ رد متعدد\n⌁ : حذف رد من متعدد\n⌁ : الردود المتعدده\n⌁ : حذف الردود المتعدده\n⌁ : حذف قوائم المنع\n⌁ : منع ↫ بالرد على ( ملصق • صوره • متحركه )\n⌁ : حذف قائمه منع + ↫ ⤈( الصور • المتحركات • الملصقات )\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁ : تنزيل الكل\n⌁ : رفع ادمن • تنزيل ادمن\n⌁ : الادمنيه • حذف الادمنيه\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁ : تثبيت\n⌁ : الغاء التثبيت\n⌁ : اعاده التثبيت\n⌁ : الغاء تثبيت الكل\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁ : تغير رد + اسم الرتبه + النص ↫ ⤈\n⌁ : المطور • منشئ الاساسي\n⌁ : المنشئ • المدير • الادمن\n⌁ : المميز • المنظف • العضو\n⌁ : حذف ردود الرتب\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁ : تغيير الايدي ↫ لتغيير الكليشه\n⌁ : تعيين الايدي ↫ لتعيين الكليشه\n⌁ : حذف الايدي ↫ لحذف الكليشه\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁ : تفعيل • تعطيل + الامر ↫ ⤈\n⌁ : اطردني • الايدي بالصوره • الابراج\n⌁ : معاني الاسماء • اوامر النسب • انطق\n⌁ : الايدي • تحويل الصيغ • اوامر التحشيش\n⌁ : ردود المدير • ردود المطور • التحقق\n⌁ : ضافني • حساب العمر • الزخرفه\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉',"md",false, false, false, false, reply_markup)
elseif text == 'م4' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ قائمة الاوامر ›', data = msg.sender.user_id..'/help1'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : اوامر المنشئ الاساسي\n— — — — — — — — —\n⌁ : رفع ، تنزيل ←{ منشئ }\n⌁ : المنشئين ، مسح المنشئين\n— — — — — — — — —\n⌁ : اوامر المنشئ المجموعه\n— — — — — — — — —\n⌁ : رفع ، تنزيل ← { مدير }\n⌁ : المدراء ، مسح المدراء\n⌁ : اضف رسائل ← { بالرد او الايدي }\n⌁ : اضف مجوهرات ← { بالرد او الايدي }\n⌁ : اضف ، حذف ← { امر }\n⌁ : الاوامر المضافه ، مسح الاوامر المضافه',"md",false, false, false, false, reply_markup)
elseif text == 'م5' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ قائمة الاوامر ›', data = msg.sender.user_id..'/help1'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : اوامر المطور الاساسي  \n— — — — — — — — —\n⌁ : حظر عام ، الغاء العام\n⌁ : اضف ، حذف ← { مطور } \n⌁ : قائمه العام ، مسح قائمه العام\n⌁ : المطورين ، مسح المطورين\n— — — — — — — — —\n⌁ : اضف ، حذف ← { رد للكل }\n⌁ : وضع ، حذف ← { كليشه المطور } \n⌁ : مسح ردود المطور ، ردود المطور \n⌁ : تحديث ،  تحديث السورس \n⌁ : تعين عدد الاعضاء ← { العدد }\n— — — — — — — — —\n⌁ : تفعيل ، تعطيل ← { الاوامر التاليه ↓}\n⌁ : البوت الخدمي ، المغادرة ، الاذاعه\n⌁ : ملف ← { اسم الملف }\n— — — — — — — — —\n⌁ : مسح جميع الملفات \n⌁ : المتجر ، الملفات\n— — — — — — — — —\n⌁ : اوامر المطور في البوت\n— — — — — — — — —\n⌁ : تفعيل ، تعطيل ، الاحصائيات\n⌁ : رفع، تنزيل ← { منشئ اساسي }\n⌁ : مسح الاساسين ، المنشئين الاساسين \n⌁ : غادر ، غادر ← { والايدي }\n⌁ : اذاعه ، اذاعه بالتوجيه ، اذاعه بالتثبيت\n⌁ : اذاعه خاص ، اذاعه خاص بالتوجيه',"md",false, false, false, false, reply_markup)
elseif text == 'الالعاب' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '⌁ : العاب السورس ', data = IdUser..'/help6'},},{{text = '⌁ : العاب المتطورة ', data = IdUser..'/degm'}, },{{text = '- اخفاء الامر ', data =IdUser..'/'.. 'delAmr'}},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/G0BBBI'}, },}}
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)end
if text == 'تحديث' or text == 'تحديث السورس' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ تحديث الملفات ›', data = msg.sender.user_id..'/UpdateFi'},{text = '‹ تحديث السورس ›', data = msg.sender.user_id..'/UpdateSo'},},{{text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr'}},}}
return LuaTele.sendText(msg_chat_id, msg_id, "⌁ : اليك ازرار التحديث الخاصة بالسورس ↫ ⤈", 'md', false, false, false, false, reply_markup) end
if text == "تغير اسم البوت" then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(itsspider.."spider:Change:Name:Bot"..msg.sender.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل لي الاسم الان ","md",true)  end
if text == "حذف اسم البوت" then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Name:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حذف اسم البوت ","md",true)   
end
if text == (Redis:get(itsspider.."spider:Name:Bot") or "فروكس") then
local NamesBot = (Redis:get(itsspider.."spider:Name:Bot") or "فروكس")
local NameBots = {
"عمر "..NamesBot.. " شتريد ؟",
"وياك القميل "..NamesBot.. "",
}
return LuaTele.sendText(msg_chat_id,msg_id, NameBots[math.random(#NameBots)],"md",true)  end
if text == "بوت" then
local NamesBot = (Redis:get(itsspider.."spider:Name:Bot") or "فروكس")
local BotName = {
"اسمي القميل "..NamesBot,
"وياك القميل "..NamesBot.. "",
}
return LuaTele.sendText(msg_chat_id,msg_id,BotName[math.random(#BotName)],"md",true)   
end
if text == 'تنظيف المشتركين' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(itsspider.."spider:Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
local ChatAction = LuaTele.sendChatAction(v,'Typing')
if ChatAction.luatele ~= "ok" then
x = x + 1
Redis:srem(itsspider..'spider:Num:User:Pv',v) end end
if x ~= 0 then return LuaTele.sendText(msg_chat_id,msg_id,'*⌁ : العدد الكلي ‹ '..#list..' ›\n⌁ : تم العثور على ‹ '..x..' › من المشتركين حاظرين البوت*',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*⌁ : العدد الكلي ‹ '..#list..' ›\n⌁ : لم يتم العثور على وهميين*',"md") end end
if text == 'تنظيف المجموعات' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(itsspider.."spider:ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
if Get_Chat.id then
local statusMem = LuaTele.getChatMember(Get_Chat.id,spider)
if statusMem.status.luatele == "chatMemberStatusMember" then
x = x + 1
LuaTele.sendText(Get_Chat.id,0,'*⌁ : البوت عضو في المجموعة سوف اغادر ويمكنك تفعيلي مره اخره *',"md")
Redis:srem(itsspider..'spider:ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(itsspider..'*'..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i]) end
LuaTele.leaveChat(Get_Chat.id) end
else
x = x + 1
local keys = Redis:keys(itsspider..'*'..v)
for i = 1, #keys do
Redis:del(keys[i]) end
Redis:srem(itsspider..'spider:ChekBotAdd',v)
LuaTele.leaveChat(v) end end
if x ~= 0 then return LuaTele.sendText(msg_chat_id,msg_id,'*⌁ : العدد الكلي ‹ '..#list..' › للمجموعات \n⌁ : تم العثور على ‹ '..x..' › مجموعات البوت ليس ادمن \n⌁ : تم تعطيل المجموعة ومغادره البوت من الوهمي *',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*⌁ : العدد الكلي ‹ '..#list..' › للمجموعات \n⌁ : لا توجد مجموعات وهميه*',"md") end end
if text == "سمايلات" or text == "سمايل" then
if Redis:get(itsspider.."spider:Status:Games"..msg.chat_id) then
Random = {"🍏","🍎","🍐","🍊","🍋","🍉","🍇","🍓","🍈","🍒","🍑","🍍","🥥","🥝","🍅","🍆","🥑","🥦","🥒","🌶","🌽","🥕","🥔","🥖","🥐","🍞","🥨","🍟","🧀","??","🍳","🥓","🥩","🍗","🍖","🌭","🍔","🍠","🍕","🥪","🥙","☕️","??","🍶","🍺","🍻","🏀","⚽️","🏈","⚾️","🎾","🏐","🏉","🎱","🏓","🏸","🥅","🎰","🎮","🎳","🎯","🎲","🎻","🎸","🎺","🥁","🎹","🎼","🎧","🎤","🎬","🎨","🎭","🎪","🎟","🎫","🎗","🏵","🎖","🏆","🥌","🛷","🚗","??","🏎","🚓","🚑","🚚","🚛","🚜","⚔","🛡","🔮","🌡","💣","᥀","📍","📓","📗","📂","📅","📪","📫","᥀","📭","⏰","📺","🎚","☎️","📡"}
SM = Random[math.random(#Random)]
Redis:set(itsspider.."spider:Game:Smile"..msg.chat_id,SM)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : اسرع واحد يدز هذا السمايل ? ~ {`"..SM.."`}","md",true) end end
if text == "كت" or text == "كت تويت" then
if Redis:get(itsspider.."spider:Status:Games"..msg.chat_id) then
local texting = {"اخر افلام شاهدتها", 
"ما هي وظفتك الحياه", 
"اعز اصدقائك ?", 
"اخر اغنية سمعتها ?", 
"تكلم عن نفسك", 
"ليه انت مش سالك", 
"اخر كتاب قرآته", 
"روايتك المفضله ?", 
"اخر اكله اكلتها", 
"افضل يوم ف حياتك", 
"ليه مضيفتش كل جهاتك", 
"حكمتك ف الحياه", 
"لون عيونك", 
"كتابك المفضل", 
"هوايتك المفضله", 
"علاقتك مع اهلك", 
" ما السيء في هذه الحياة ؟ ", 
"أجمل شيء حصل معك خلال هذا الاسبوع ؟ ", 
"سؤال ينرفزك ؟ ", 
" اكثر ممثل تحبه ؟ ", 
"قد تخيلت شي في بالك وصار ؟ ", 
"شيء عندك اهم من الناس ؟ ", 
"تفضّل النقاش الطويل او تحب الاختصار ؟ ", 
"وش أخر شي ضيعته؟ ", 
"كم مره حبيت؟ ", 
" اكثر المتابعين عندك باي برنامج؟", 
" آخر مره ضربت عشره كانت متى ؟", 
" نسبه الندم عندك للي وثقت فيهم ؟", 
" جربت شعور احد يحبك بس انت مو قادر تحبه؟", 
" تجامل الناس ولا اللي بقلبك على لسانك؟", 
" عمرك ضحيت باشياء لاجل شخص م يسوى ؟", 
"مغني تلاحظ أن صوته يعجب الجميع إلا أنت؟ ", 
" آخر غلطات عمرك؟ ", 
" مسلسل كرتوني له ذكريات جميلة عندك؟ ", 
" ما أكثر تطبيق تقضي وقتك عليه؟ ", 
" أول شيء يخطر في بالك إذا سمعت كلمة نجوم ؟ ", 
" قدوتك من الأجيال السابقة؟ ", 
" أكثر طبع تهتم بأن يتواجد في شريك/ة حياتك؟ ", 
"أكثر حيوان تخاف منه؟ ", 
" ما هي طريقتك في الحصول على الراحة النفسية؟ ", 
" إيموجي يعبّر عن مزاجك الحالي؟ ", 
" أكثر تغيير ترغب أن تغيّره في نفسك؟ ", 
"أكثر شيء أسعدك اليوم؟ ", 
"اي رايك في الدنيا دي ؟ ", 
"ما هو أفضل حافز للشخص؟ ", 
"ما الذي يشغل بالك في الفترة الحالية؟", 
"آخر شيء ندمت عليه؟ ", 
"شاركنا صورة احترافية من تصويرك؟ ", 
"تتابع انمي؟ إذا نعم ما أفضل انمي شاهدته ", 
"يرد عليك متأخر على رسالة مهمة وبكل برود، موقفك؟ ", 
"نصيحه تبدا ب -لا- ؟ ", 
"كتاب أو رواية تقرأها هذه الأيام؟ ", 
"فيلم عالق في ذهنك لا تنساه مِن روعته؟ ", 
"يوم لا يمكنك نسيانه؟ ", 
"شعورك الحالي في جملة؟ ", 
"كلمة لشخص بعيد؟ ", 
"صفة يطلقها عليك الشخص المفضّل؟ ", 
"أغنية عالقة في ذهنك هاليومين؟ ", 
"أكلة مستحيل أن تأكلها؟ ", 
"كيف قضيت نهارك؟ ", 
"تصرُّف ماتتحمله؟ ", 
"موقف غير حياتك؟ ", 
"اكثر مشروب تحبه؟ ", 
"القصيدة اللي تأثر فيك؟ ", 
"متى يصبح الصديق غريب ", 
"وين نلقى السعاده برايك؟ ", 
"تاريخ ميلادك؟ ", 
"قهوه و لا شاي؟ ", 
"من محبّين الليل أو الصبح؟ ", 
"حيوانك المفضل؟ ", 
"كلمة غريبة ومعناها؟ ", 
"كم تحتاج من وقت لتثق بشخص؟ ", 
"اشياء نفسك تجربها؟ ", 
"يومك ضاع على؟ ", 
"كل شيء يهون الا ؟ ", 
"اسم ماتحبه ؟ ", 
"وقفة إحترام للي إخترع ؟ ", 
"أقدم شيء محتفظ فيه من صغرك؟ ", 
"كلمات ماتستغني عنها بسوالفك؟ ", 
"وش الحب بنظرك؟ ", 
"حب التملك في شخصِيتك ولا ؟ ", 
"تخطط للمستقبل ولا ؟ ", 
"موقف محرج ماتنساه ؟ ", 
"من طلاسم لهجتكم ؟ ", 
"اعترف باي حاجه ؟ ", 
"عبّر عن مودك بصوره ؟ ",
"آخر مره ضربت عشره كانت متى ؟", 
"اسم دايم ع بالك ؟ ", 
"اشياء تفتخر انك م سويتها ؟ ", 
" لو بكيفي كان ؟ ", 
  "أكثر جملة أثرت بك في حياتك؟ ",
  "إيموجي يوصف مزاجك حاليًا؟ ",
  "أجمل اسم بنت بحرف الباء؟ ",
  "كيف هي أحوال قلبك؟ ",
  "أجمل مدينة؟ ",
  "كيف كان أسبوعك؟ ",
  "شيء تشوفه اكثر من اهلك ؟ ",
  "اخر مره فضفضت؟ ",
  "قد كرهت احد بسبب اسلوبه؟ ",
  "قد حبيت شخص وخذلك؟ ",
  "كم مره حبيت؟ ",
  "اكبر غلطة بعمرك؟ ",
  "نسبة النعاس عندك حاليًا؟ ",
  "شرايكم بمشاهير التيك توك؟ ",
  "ما الحاسة التي تريد إضافتها للحواس الخمسة؟ ",
  "اسم قريب لقلبك؟ ",
  "مشتاق لمطعم كنت تزوره قبل الحظر؟ ",
  "أول شيء يخطر في بالك إذا سمعت كلمة (ابوي يبيك)؟ ",
  "ما أول مشروع تتوقع أن تقوم بإنشائه إذا أصبحت مليونير؟ ",
  "أغنية عالقة في ذهنك هاليومين؟ ",
  "متى اخر مره قريت قرآن؟ ",
  "كم صلاة فاتتك اليوم؟ ",
  "تفضل التيكن او السنقل؟ ",
  "وش أفضل بوت برأيك؟ ",
"كم لك بالتلي؟ ",
"وش الي تفكر فيه الحين؟ ",
"كيف تشوف الجيل ذا؟ ",
"منشن شخص وقوله، تحبني؟ ",
"لو جاء شخص وعترف لك كيف ترده؟ ",
"مر عليك موقف محرج؟ ",
"وين تشوف نفسك بعد سنتين؟ ",
"لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟ ",
"وش اجمل لهجة تشوفها؟ ",
"قد سافرت؟ ",
"افضل مسلسل عندك؟ ",
"افضل فلم عندك؟ ",
"مين اكثر يخون البنات/العيال؟ ",
"متى حبيت؟ ",
  "بالعادة متى تنام؟ ",
  "شيء من صغرك ماتغير فيك؟ ",
  "شيء بسيط قادر يعدل مزاجك بشكل سريع؟ ",
  "تشوف الغيره انانيه او حب؟ ",
"حاجة تشوف نفسك مبدع فيها؟ ",
  "مع او ضد : يسقط جمال المراة بسبب قبح لسانها؟ ",
  "عمرك بكيت على شخص مات في مسلسل ؟ ",
  "‏- هل تعتقد أن هنالك من يراقبك بشغف؟ ",
  "تدوس على قلبك او كرامتك؟ ",
  "اكثر لونين تحبهم مع بعض؟ ",
  "مع او ضد : النوم افضل حل ل مشاكل الحياة؟ ",
  "سؤال دايم تتهرب من الاجابة عليه؟ ",
  "تحبني ولاتحب الفلوس؟ ",
  "العلاقه السريه دايماً تكون حلوه؟ ",
  "لو أغمضت عينيك الآن فما هو أول شيء ستفكر به؟ ",
"كيف ينطق الطفل اسمك؟ ",
  "ما هي نقاط الضعف في شخصيتك؟ ",
  "اكثر كذبة تقولها؟ ",
  "تيكن ولا اضبطك؟ ",
  "اطول علاقة كنت فيها مع شخص؟ ",
  "قد ندمت على شخص؟ ",
  "وقت فراغك وش تسوي؟ ",
  "عندك أصحاب كثير؟ ولا ينعد بالأصابع؟ ",
  "حاط نغمة خاصة لأي شخص؟ ",
  "وش اسم شهرتك؟ ",
  "أفضل أكلة تحبه لك؟ ",
"عندك شخص تسميه ثالث والدينك؟ ",
  "اذا قالو لك تسافر أي مكان تبيه وتاخذ معك شخص واحد وين بتروح ومين تختار؟ ",
  "أطول مكالمة كم ساعة؟ ",
  "تحب الحياة الإلكترونية ولا الواقعية؟ ",
  "كيف حال قلبك ؟ بخير ولا مكسور؟ ",
  "أطول مدة نمت فيها كم ساعة؟ ",
  "تقدر تسيطر على ضحكتك؟ ",
  "أول حرف من اسم الحب؟ ",
  "تحب تحافظ على الذكريات ولا تمسحه؟ ",
  "اسم اخر شخص زعلك؟ ",
"وش نوع الأفلام اللي تحب تتابعه؟ ",
  "أنت انسان غامض ولا الكل يعرف عنك؟ ",
  "لو الجنسية حسب ملامحك وش بتكون جنسيتك؟ ",
  "عندك أخوان او خوات من الرضاعة؟ ",
  "إختصار تحبه؟ ",
  "إسم شخص وتحس أنه كيف؟ ",
  "وش الإسم اللي دايم تحطه بالبرامج؟ ",
  "وش برجك؟ ",
  "لو يجي عيد ميلادك تتوقع يجيك هدية؟ ",
  "اجمل هدية جاتك وش هو؟ ",
  "الصداقة ولا الحب؟ ",
"الصداقة ولا الحب؟ ",
  "الغيرة الزائدة شك؟ ولا فرط الحب؟ ",
    "هل انت دي تويت باعت باندا؟ ",
  "قد حبيت شخصين مع بعض؟ وانقفطت؟ ",
  "وش أخر شي ضيعته؟ ",
  "قد ضيعت شي ودورته ولقيته بيدك؟ ",
  "تؤمن بمقولة اللي يبيك مايحتار فيك؟ ",
  "سبب وجوك بالتليجرام؟ ",
  "تراقب شخص حالياً؟ ",
  "عندك معجبين ولا محد درا عنك؟ ",
  "لو نسبة جمالك بتكون بعدد شحن جوالك كم بتكون؟ ",
  "أنت محبوب بين الناس؟ ولاكريه؟ ",
"كم عمرك؟ ",
  "لو يسألونك وش اسم امك تجاوبهم ولا تسفل فيهم؟ ",
  "تؤمن بمقولة الصحبة تغنيك الحب؟ ",
  "وش مشروبك المفضل؟ ",
  "قد جربت الدخان بحياتك؟ وانقفطت ولا؟ ",
  "أفضل وقت للسفر؟ الليل ولا النهار؟ ",
  "انت من النوع اللي تنام بخط السفر؟ ",
  "عندك حس فكاهي ولا نفسية؟ ",
  "تبادل الكراهية بالكراهية؟ ولا تحرجه بالطيب؟ ",
  "أفضل ممارسة بالنسبة لك؟ ",
  "لو قالو لك تتخلى عن شي واحد تحبه بحياتك وش يكون؟ ",
"لو احد تركك وبعد فتره يحاول يرجعك بترجع له ولا خلاص؟ ",
  "برأيك كم العمر المناسب للزواج؟ ",
  "اذا تزوجت بعد كم بتخلف عيال؟ ",
  "فكرت وش تسمي أول اطفالك؟ ",
  "من الناس اللي تحب الهدوء ولا الإزعاج؟ ",
  "الشيلات ولا الأغاني؟ ",
  "عندكم شخص مطوع بالعايلة؟ ",
  "تتقبل النصيحة من اي شخص؟ ",
  "اذا غلطت وعرفت انك غلطان تحب تعترف ولا تجحد؟ ",
  "جربت شعور احد يحبك بس انت مو قادر تحبه؟ ",
  "دايم قوة الصداقة تكون بإيش؟ ",
"أفضل البدايات بالعلاقة ب وش؟ ",
  "وش مشروبك المفضل؟ او قهوتك المفضلة؟ ",
  "تحب تتسوق عبر الانترنت ولا الواقع؟ ",
  "انت من الناس اللي بعد ماتشتري شي وتروح ترجعه؟ ",
  "أخر مرة بكيت متى؟ وليش؟ ",
  "عندك الشخص اللي يقلب الدنيا عشان زعلك؟ ",
  "أفضل صفة تحبه بنفسك؟ ",
  "كلمة تقولها للوالدين؟ ",
  "أنت من الناس اللي تنتقم وترد الاذى ولا تحتسب الأجر وتسامح؟ ",
  "كم عدد سنينك بالتليجرام؟ ",
  "تحب تعترف ولا تخبي؟ ",
"انت من الناس الكتومة ولا تفضفض؟ ",
  "أنت بعلاقة حب الحين؟ ",
  "عندك اصدقاء غير جنسك؟ ",
  "أغلب وقتك تكون وين؟ ",
  "لو المقصود يقرأ وش بتكتب له؟ ",
  "تحب تعبر بالكتابة ولا بالصوت؟ ",
  "عمرك كلمت فويس احد غير جنسك؟ ",
  "لو خيروك تصير مليونير ولا تتزوج الشخص اللي تحبه؟ ",
  "لو عندك فلوس وش السيارة اللي بتشتريها؟ ",
  "كم أعلى مبلغ جمعته؟ ",
  "اذا شفت احد على غلط تعلمه الصح ولا تخليه بكيفه؟ ",
"قد جربت تبكي فرح؟ وليش؟ ",
"تتوقع إنك بتتزوج اللي تحبه؟ ",
  "ما هو أمنيتك؟ ",
  "وين تشوف نفسك بعد خمس سنوات؟ ",
  "هل انت حرامي تويت بتعت باندا؟ ",
  "لو خيروك تقدم الزمن ولا ترجعه ورا؟ ",
  "لعبة قضيت وقتك فيه بالحجر المنزلي؟ ",
  "تحب تطق الميانة ولا ثقيل؟ ",
  "باقي معاك للي وعدك ما بيتركك؟ ",
  "اول ماتصحى من النوم مين تكلمه؟ ",
  "عندك الشخص اللي يكتب لك كلام كثير وانت نايم؟ ",
  "قد قابلت شخص تحبه؟ وولد ولا بنت؟ ",
   "هل انت تحب باندا؟ ",
"اذا قفطت احد تحب تفضحه ولا تستره؟ ",
  "كلمة للشخص اللي يسب ويسطر؟ ",
  "آية من القران تؤمن فيه؟ ",
  "تحب تعامل الناس بنفس المعاملة؟ ولا تكون أطيب منهم؟ ",
"حاجة ودك تغيرها هالفترة؟ ",
  "كم فلوسك حالياً وهل يكفيك ام لا؟ ",
  "وش لون عيونك الجميلة؟ ",
  "من الناس اللي تتغزل بالكل ولا بالشخص اللي تحبه بس؟ ",
  "اذكر موقف ماتنساه بعمرك؟ ",
  "وش حاب تقول للاشخاص اللي بيدخل حياتك؟ ",
  "ألطف شخص مر عليك بحياتك؟ ",
   "هل باندا لطيف؟ ",
"انت من الناس المؤدبة ولا نص نص؟ ",
  "كيف الصيد معاك هالأيام ؟ وسنارة ولاشبك؟ ",
  "لو الشخص اللي تحبه قال بدخل حساباتك بتعطيه ولا تكرشه؟ ",
  "أكثر شي تخاف منه بالحياه وش؟ ",
  "اكثر المتابعين عندك باي برنامج؟ ",
  "متى يوم ميلادك؟ ووش الهدية اللي نفسك فيه؟ ",
  "قد تمنيت شي وتحقق؟ ",
  "قلبي على قلبك مهما صار لمين تقولها؟ ",
  "وش نوع جوالك؟ واذا بتغيره وش بتأخذ؟ ",
  "كم حساب عندك بالتليجرام؟ ",
  "متى اخر مرة كذبت؟ ",
"كذبت في الاسئلة اللي مرت عليك قبل شوي؟ ",
  "تجامل الناس ولا اللي بقلبك على لسانك؟ ",
  "قد تمصلحت مع أحد وليش؟ ",
  "وين تعرفت على الشخص اللي حبيته؟ ",
  "قد رقمت او احد رقمك؟ ",
  "وش أفضل لعبته بحياتك؟ ",
  "أخر شي اكلته وش هو؟ ",
  "حزنك يبان بملامحك ولا صوتك؟ ",
  "لقيت الشخص اللي يفهمك واللي يقرا افكارك؟ ",
  "فيه شيء م تقدر تسيطر عليه ؟ ",
  "منشن شخص متحلطم م يعجبه شيء؟ ",
"اكتب تاريخ مستحيل تنساه ",
  "شيء مستحيل انك تاكله ؟ ",
  "تحب تتعرف على ناس جدد ولا مكتفي باللي عندك ؟ ",
  "انسان م تحب تتعامل معاه ابداً ؟ ",
  "شيء بسيط تحتفظ فيه؟ ",
  "فُرصه تتمنى لو أُتيحت لك ؟ ",
   "لي باندا ناك اليكس؟ ",
  "شيء مستحيل ترفضه ؟. ",
  "لو زعلت بقوة وش بيرضيك ؟ ",
  "تنام ب اي مكان ، ولا بس غرفتك ؟ ",
  "ردك المعتاد اذا أحد ناداك ؟ ",
  "مين الي تحب يكون مبتسم دائما ؟ ",
" إحساسك في هاللحظة؟ ",
  "وش اسم اول شخص تعرفت عليه فالتلقرام ؟ ",
  "اشياء صعب تتقبلها بسرعه ؟ ",
  "شيء جميل صار لك اليوم ؟ ",
  "اذا شفت شخص يتنمر على شخص قدامك شتسوي؟ ",
  "يهمك ملابسك تكون ماركة ؟ ",
  "ردّك على شخص قال (أنا بطلع من حياتك)؟. ",
  "مين اول شخص تكلمه اذا طحت ب مصيبة ؟ ",
  "تشارك كل شي لاهلك ولا فيه أشياء ما تتشارك؟ ",
  "كيف علاقتك مع اهلك؟ رسميات ولا ميانة؟ ",
  "عمرك ضحيت باشياء لاجل شخص م يسوى ؟ ",
"اكتب سطر من اغنية او قصيدة جا ف بالك ؟ ",
  "شيء مهما حطيت فيه فلوس بتكون مبسوط ؟ ",
  "مشاكلك بسبب ؟ ",
  "نسبه الندم عندك للي وثقت فيهم ؟ ",
  "اول حرف من اسم شخص تقوله? بطل تفكر فيني ابي انام؟ ",
  "اكثر شيء تحس انه مات ف مجتمعنا؟ ",
  "لو صار سوء فهم بينك وبين شخص هل تحب توضحه ولا تخليه كذا لان مالك خلق توضح ؟ ",
  "كم عددكم بالبيت؟ ",
  "عادي تتزوج من برا القبيلة؟ ",
  "أجمل شي بحياتك وش هو؟ ",
} 
return LuaTele.sendText(msg_chat_id,msg_id,texting[math.random(#texting)],'md') end end
if text == "غزل"or text == "غز"then
if Redis:get(itsspider.."spider:Status:Games"..msg.chat_id) then
local texting = {"‌‏-‏حـب عظيم لڪل لحظه جمـيله بيني وبينڪ🌼", 
"حيلي على حيلك لو شفت التعب صابك .🤍",  
"مچانت امنيتي اذا مَر بيك اسمي تگول احبه🤍",  
"أبتسّمي فلا جمِيلة إلا أنتِ 🤍",  
"يا أخطرُ وجهٍ عربيَّ ، يا أجِملُ نُِساء الأرُض 🤍",  
"يـ المعدل يگلهن بيك يلمامش شِعر يكفيك 🤍",   
"أنتِ الشروق و أنتِ النور في عُمري 🤍", 
"حيلي على حيلك لو شفت التعب صابك 🤍",  
"مچانت امنيتي اذا مَر بيك اسمي تگول احبه🤍",  
"أبتسّمي فلا جمِيلة إلا أنتِ 🤍",  
"يا أخطرُ وجهٍ عربيَّيا أجِملُ نُِساء الأرُض 🤍",  
"يـ المعدل يگلهن بيك يلمامش شِعر يكفيك 🤍",  
"أنتِ الشروق و أنتِ النور في عُمري 🤍",  
"عنـدما احـادثك ابــتسم حبـاً دون ان اشــعر",  
"انا بنت قويهۂ لكـטּ قلبـⴢ̤ قلب طفلهۂ 🥺💘🦋",  
"مِثل الشيب عايش أبيض ومَذموم",  
"ﭑبتسميَ فـ لايليق بالقمرِ أن يحزن ♥️⚜️",  
"اروحَـن وين؟ آنه ولايـتـي عيونَك🥺✨🖤",  
"كيف لي ان ارى غيرك وانت عيناي🥺✨🖤",  
"- اقدس نفسيو كأني شيء كارثي••♥️",  
"الجميع يظنّه صديقي وأنا أظنّه الجميع•♥️",  
"؏ـَلـى ايـَدك اࢪيـد اخـتـَم عزوبيتـَي💍♥️",  
"سأختارك دائما وكأنك الوحيد والأبدي 💛",  
"لهُـم الحَـيآة بـہ اكملهـآ ولـي حضنڪ 💛",  
"شسويتلي وهالگد صرت مشتاگلك ♥️",  
"‏‏حـضنڪـہ ثـم لـﭑ ﭑريـُد شـيء ﭑخـࢪ",  
"مَا تشتاكَلي ياا شمَالك نسِيت سوالفي الحّلوه 💔💔",  
"شايف من تحب انسان وماتكدر تگله 🥺 💔💔",  
"‏‏شما تنام يعيش بعيونك حلم كتاله باﭼر🥀",  
"‏‏وانا حَاير بين انسّى وبين احِن💔",  
"انا متعـب يا الله الـم يحن وقت الرحـيل 🥀💔",  
"فشلتني گبال روحي وگابلت روحي وبچيت",  
"اشتقت لحديثك وكأني لم أحادثك منذ سنين",  
"الديرهَ المابيهه حسّك طافيّه بخدهه السٓوالف 🖤",  
"وعلي من گد ما أغار أتمنى كُل الناس أخوتچ ♥️",  
"مُجرد فتاة خابت كُل أمنيتهٌا🌻",  
"هي كانت تُشبه أغنيتي المُفضَّلة♡",  
"-نيتـي بيضه وبختـي يـم الله جبيـر🥺♥️",  
"و قد يغيّر الله كلَّ شيء بدعاءٍ صادق",  
"گلبك المابي محنةشينفع وياه العتب",  
"أنا النعمه التي ستبكيَ على فقدانهها 🤷🏻‍♀️):",  
"الأمر تخطى كونه حُبأنت جزء مني♡",  
"وأحببتك حب لٱ يعلمه الا م̷ـــِْن خلقك",  
"‏‏مِن فرط رقـتۿا كَادت أن تَطيـر 🧕🏻🖤",  
"لأنھا قصيرة يصبح عناقھا أجمل 🙆🏻‍♀️💜",  
"وجـۿ متــعوب مـو ڪَـد مواليـدي 🙇🏿‍♀🖤",  
"لا رضـينه نـعيش جـذبه ولا تـونسنهبصدڪ 🙇🏿‍♀️🖤",  
"لا رضـينه نـعيش جـذبه ولا تـونسنهبصدڪ 🙇🏿‍♀️🖤",  
"امس غنيتلك حزني وغفيت انته 💔🙂",  
"اني يا يڪلموني ستالاف شخص بنفس الدقيقة يا محد يڪلمني",  
"ضيـعتني وأنـۿ رايـحمـني لاتتـناش جيـۿ",  
"أجَدَّك وطن وبِلاد وسّلام يعانقُني",  
"والشالج هذه معدل ماخذ غيره م̷ـــِْن العباس",  
"گلوب المايردها الشوگ شيردها",  
"ما الذي يشغل بالك في الفترة الحالية؟",  
"منـين ما التـفت الڪة العمـر ذبـلان",  
"اڪو نـاس مـثل الفحـم منیـن ماتـلزمهــم وصخیـن",  
"-شتفيد الاحبک وانتـه ماتعـرف تحبني؟",  
"ڪُل سـالفة تخصـڪتهـز ڪَلبي 🖤",  
"شڪَد ميـتين بسـوالف بعـض چنـة 🖤",  
"لا تفرح اذا حولك كثير ترا الرخص يجيب الزباين",  
"كم هو مؤلم أن تترك سريرك كل صباح لترى أشكال تسد النفس 𖤐🌚💔",  
"يڪللۿ تعآليلي هاي النآس ما تعرف تلوليّلي 𔘓",  
"شلۅن عٓينك ناﭑمت ۅڪلبي يۅن 🙇‍♂💗🎻",  
"شَـوارع بغَـداد واغنُـية وعِيونڬ",  
"عـتڪَ خلڪَيوملامـح وجهـي ذبلانـة",  
"چـانت الدنـيا آمـان وچـانو أصحـابي بَـشر",  
"للخيانھ ألف بابً و ﺎحبابنا ما قصروا",  
"متبدل بطبعه الهوى لو حنا اتبدلنه",  
"السكوت وياك أحلى من الحچي وياهم 🤍",  
"ولو رأى الكافِرُعِيناك لـ قال أمنّا برب تِلك العُيون 🖤",  
"‏-‏ منذ أن عَرفتك حتى الآن كُنتُ على يقينٍ بأنني لن أُحب أحداً بهذا العمق والأنتماء",  
"عيناكِ سحر كـاد يهلِكني , فمَن ذَا الذي عن جمالِ عيناكِ يصبِر",  
"‏-‏ هل خلق الجمال لتختصره عيناك عيونك أجمل من السماء بنجومها✨",  
"‏-‏ كل نواحي قلبي مغرمة فيك",  
"‏-‏‏يا ليّتني كل النَاظرين إليك",  
"‏-‏‏أحبُ الطريق إن كان نحوك",  
"‏-‏‏أحتى لو انتهى اللي بينا بتضل من اسعد الذكريات اللي عشتها بحياتي واتمنى انگ تكون بخير دايم",  
"‏-‏‏أوﺧـليـڪ ؏ـلـى טּـضࢪت شـوڪ تتـﺣـسـࢪ وࢪاويـڪ لوﺟـوه شلـوטּ مـטּ تـثڪـل بـصـيطه ابو ڪـࢪش😒",  
"‏-‏‏أوسكوت عَميق يَكتِمُ أنفاسي ويحطم قلبي",  
"-‏‏أابيك كلك وحقي وعشاني والله بلاك بعاشق حيييل أناني",  
"‏‏ستـَزول المسافـۿ يومـاً ما وأحتضنك 📮🤍",  
"في كل مره تكسر قلبي بها احاول ان لا اكرهك لا اريد خسارتك او ان نفترق ارجوك كُف عن هذه الأفعال",  
"حضن ايدك امان الدنيا كلها",  
"أحببتك كما تحبك تلك ألتي أنجبتك وأكثر",  
"‏كـيف لـكتـاخذ قـلبي و انـت بـكل هـذا الـبعد ❤",  
"ربااه أني احبه حبآ كائنمآ لم أحب أحدآ مثلما أحببته 🥺♥",  
"ﭑريَدك ﭑنتهَۿِ مِا ﭑريد ﭑلايَام تجيبَ ﭑلاحَسن منكِ",  
"أود معانقتك حتى تسقط يداي تعبآ🖤🥀",  
"في حلمي انت لي 😍لكن في واقعي انت حلمي😔",  
"وڪونك تحِبني صَدك چا دوَرتني ♥️",  
"صُحبتك زرعت بقلبي جناين ورد",  
"‏الوقوع في حب شخص حنون نجاة❤️",  
"يا جمـالاً ليس له اربعيـن",  
"‏‏آخ يا ذاك التعب بدو أسنين الندى بحضن الگصب",  
"‏‏انتَ يَ الچنك دُعآء بشفة امي",  
"‏‏وأحچيلك شكد حچي وتجاوب بكلمه",  
"‏‏‏لديَّ الكثير من الأصدقاء في صديقٍ واحد",  
"‏‏‏شحلاة ألشيب البشعرك ضوه مطَشر يا أول وجه يصغر شما يكبر",  
"‏‏‏الضرۅف تصفي الاصحاب واحد واحد لا تستعجلون 🤷",  
"‏‏‏اسندج بگلبي اذا جان الجتف مخلوع 💔",  
"‏‏‏كــن لطيفاً بــحديثـك فـبعضـهم يـعانـي مـن ألـم الحياة",  
"‏‏‏چن هآي أخر رساله وچن ودآع تآليها",  
"‏‏‏لغيرج ههالكلب لا رحَـب و لا سَـلم",  
"‏‏‏اكو حچايات ما تنگآل الآ عيونك گبالي",  
"‏‏‏ردتك شيبه تبقه براسي حد ماموت",  
"‏‏‏هـاي الـدنيه تـريـد واهـس وانـي مـيتلي خـلك",  
"مـثل الـعافـيه كـون تـصير مـوش بـكل وجـه تـنكال",  
"الـحلام تـموت والاصـدقاء يـرحلون والـحب كـذبه سـتبقۍ وحيداً أعدك",  
"وتـبقۍ الحمدالله هـي الكلمه الوحيده المعبره عـن كـل حـال",  
"شـجاك وكـمت مـا تـشتاك هـوا الـشوك شيكلفك؟",  
"أورثلك جكارة ونگعد نسولف واكلك شگد تَعبتني",  
"ألليل وألحيل وسهر عيني الثگيل كلهن ألتمن يخايب من وراك",  
"من رمش لرمش بعيوني تتمشة",  
"انت تهمل وغيرك يهتمياسيدي والقلب ميال",  
"المن ترد ضل غادِ عايش مبتِعد",  
"مآبين الگطن والغيم والنجمات لونج ماخذ الاول",  
"حاجيني بعيونك حجيهن يختلف",  
"عيونج غنوة السبعين وحجايات بغدادية",  
"يا حنه بجفوف السهر مُر على طين ولايتي",  
"ڪٌل الأشيّاء الحِلوه تِشبَهه عيّونه",  
"احنا ناس گلوبنا تعيش برسالة",  
"اكتبلها شعر ودكلي المن هايمن فدوه لغبائج هيج مو يمج",  
"يـﭑفـࢪحتي مـن تـمـࢪني وتـڪلي ﭑحـبج",  
"وش الي تفكر فيه الحين؟",  
"يكفينىمنالدنياوجودكجانبي",  
"باچر الأيام تحله وگلبك جروحه يوردن",  
"أحـنه چـي نعشگ حلآل معَـذبين",  
"عليش اشتاگ وأنت بلاعذر غايب",  
"اكول قبل ماافتح عيوني افز واقرة رسايلها",  
"گالو الحرمل يغثك طگطگتلك هيل",  
"ضوگ روحك حتى تعذرني من اغار",  
"‏ تگوله خلي أتعب وأتعب وعلى سوالف صوتك أرتاح",  
"‏ شوكت الگاج يمي وأبقه صافن بيج",  
"حيل اشتاگ ‏بس مَحتار انطي ليا وِجه شوگي",  
"مين اكثر يخون البنات/العيال؟",  
"بعد للحيل ماضل حيل ‏حتى نعاتبك يا ليل",  
"خفيفة سوالفك چنهن مُطر صيف",  
"ياريت الشاغلاتك كلهن آنه",  
"‏ تعبي ضاع مثل شامه بخد عبد ♡",  
"عيش بيه الدنيا ما تستاهلَك♡",  
"‏كُلما أردت إلقاء نظرة على أجمل أيامي وجدتك",  
"‏أول مشاوير العمر جانت عيونك",  
"‏شعور قوي تكون انت سند لنفسك",  
"‏أستسهلوك بكثر ما شفتك صعب",  
"‏خليتني بلايه خلگ ما أحمل حجايه",  
"‏سالفتي طويلة وياك يمتى ألگاك",  
"‏أنام بحضن صوتك وأصبح ؏ خيرك",  
"‏بعدها ألدنيا تلجمني وأجي أشكيلك",  
"لا يرغبُ اݪـمݛء في اݪـحب بقدر رغبتِه في أن يَفهمهُ أحدهُم",  
"‏خفِف حمولة قلبك بالتخلّي فليست كل الأشياء تستحق الاهتمام",  
"‏ﭑنت هَواي ؏ـايفنـჂ̤ ليـشہ تضوج مـטּ تَسمع غيرڪ واحد يحبنـჂ̤",  
"دفوُ صوتك من يمُر تخِدر مدينه بحالهآ",  
"كُن مختلفاً فالعالم لايريد مَزيد من النسخ",  
"أُغنية بأُغنية والبادي ألطف",  
"منذ مجيئك إلى عالمي الكئيب بدأت أزهر",  
"إستمع لأغنيتك المُفضلة وشاهد فيلمك المُفضل وتجنب الكائنات البشرية المزعجة♡",  
"‏تكلي شلون صحتك أكلك مابقت صحه♡",  
"أُراقبك بشكل لا يوحي بأنني مُهتم وهذا بلائي♡",  
"‏‏يصبح الإنسان خطيراً عندما يتعلم كيف يتحكم بمشاعره♡",  
"‏‏كانوُا أخف مِن البَقاءكُنّا أثقَل مِن اللِحاق بِهُم♡",  
"‏‏‏يتعافى الإنسَان برسائِل من يُحب ♡",  
"‏‏‏المواقف تعطيك الإجابات بكُل وضوح فَلا تتظاهر بِالعمى♡",  
"‌‏لا أستطيع رؤيه سيئاتك كل ما أراه هو النقاء ♡",  
"‌‏حاچيني اشتهيت إسمي إعله گد صوتك♡",  
"راهن على الذي لا يرتكب أخطاءً إملائية إلا في محادثتك♡",  
"هذا العالم لا يُعامل اللطّف باللطّف♡",  
"ڪلوب النااس ﻢ تشبةه شڪلهااه ♡",  
"يمر الوڪت والـ ذڪرا ندامةه ♡",  
"كلما زاد الوعي زاد اليأس ♡",  
"‏‏‏‏تجاهل كل شيء يزعجك الأيام لا تعوض♡",  
"مضـيت بمفـࢪدي لم أࢪى أيـآآ منكم بجـانبي♡",  
"‏‏‏‏حلم سكران شيذكرك بعد بيه♡",  
"بشـر بي راحـَتي وتعبـي♡",  
"الإهتمام عظيم قد يغلب الحب احيانآ♡",  
"‏التظاهر بالسعادة أسهل من شرح حزنك للآخرين♡",  
"قد ننسئ الألملكن لا ننسئ من زرعه♡",  
"من لا يؤدبه ضميره تؤدبه الحياة حين تدور♡",  
"‏‏لڪنه لا يُغادر عقلي بينما يضن انّه اصبح منسي♡",  
"‏‏من يحبك حقاً هو من يبقى بجانبك عندما لاتطاق♡",  
"أنـا ايضًا أتقـن التجاهلهل تَود التـجربة♡",  
"‏‏ݪماذا تبڪين دخلت الاغنيةه في عينـي♡",  
"‏‏لا شأن لي بجمال روحك مادام لسانك مؤذيآ♡",  
"‏‏من الغباءاطالة الندم علئ شيئ انتهئ♡",  
"‏‏ليس غرورآأنما انا فعلآ لا اتعوض♡",  
"‏‏انا دائما على استعداد لأفقد جميع الاشياء♡",  
"‏‏أجمل مافي التقدم في العمر أنه يجعلك تستصغر اموراً كثيرة♡",  
"‏‏واجه مشاكلك لوحدك كي تجد نفسك اقوئ من كل مره♡",  
"‏‏الانسحاب من الفوضى راحة لا مثيل لها♡",  
"‏‏ﺎڪره ان يشارڪني احد بأشيائي الخاصةه واولهن انتَ♡",  
"ياهو احَن مني ويحبج ؟♡",  
"شتفيد الاحبک وانتـه ماتعـرف تحبني♡",  
"ﭑنَـت لو تـحچي ﭑلـصدڪ چا ما خسـرتڪك♡",  
"عقل الشخص مغري اكثر من شكله♡",  
"كثريلي من الزعل إذا چان العتب شبگة♡",  
"أني مطمئنه لاني أثق بالله 🤍♡",  
"آريـد اصفـن بوجهـك صفنـه الميتـين🤍♡",  
"‏‏الليلَ باك اعمارنه بحجهْ سهر 🤍♡",  
"يـ المعدل يگلهن بيك يلمامش شِعر يكفيك 🤍♡",  
"-‏‏ ناسّيني وانَه ألچنت بگلوُبهم گاعد لو مَيت وُلا شفت مَلگاهم ألبارَد ☹️💞💞💞♡",  
"نحلملاكننا مستمرين بالعيش 🙂🍷♡",  
"‏أميزك لو صرت براس النوارس شيب♥️💍♡",  
"‏‏أحبك دائماً كالمره الأولى♡",  
"‏‏ﭑبتسميَ فـ لايليق بالقمرِ أن يحزن ♥️⚜️♡",  
"‏‏اروحَـن وين؟ آنه ولايـتـي عيونَك🥺✨🖤♡",  
"‏‏كيف لي ان ارى غيرك وانت عيناي🥺✨🖤♡",  
"‏الجميع يظنّه صديقي وأنا أظنّه الجميع•♥️♡",  
"‏شلـون اختار غيرك وانـت ماليني✨♥️♡",  
"‏‏من عرفتك وأنـا قلبـي بالمحبة لك يزيد✨♥️",  
"عيـــَونـه تخبـــل يـداده 👌💍♥️",  
"لهُـم الحَـيآة بـہ اكملهـآ ولـي حضنڪ 💛",  
"سأختارك دائما وكأنك الوحيد والأبدي 💛💛",  
"‏‏شسويتلي وهالگد صرت مشتاگلك ♥️💛",  
"‏‏سـأكون دائـمآ مـوجـودة لك ولأجـلك✨♥️💛",  
"‏‏الله وصانه بثلث نعمات عنده التـين والزيتون وأنتي ♥️",  
"‏‏يا رب البسلك الأبيض ويشهد العالم بحبنا 💍💛",  
"‏‏بينما انت تتجاهلها غيرك يرآاها سُڪر محلى 🤤♥💛",  
"‏‏يا أول سند للروح من يلتم عليها الهّم♥️🧜🏻‍♀️",  
"‏‏شِفت وجهك دنيا فرحانة و رحل عنها الحزن 🥺❤️",  
"‏‏محـلـيـَه ايامـي ومحليتنـي 🌻",  
"ينتـۿي عمري ومينتهـي حبـَها",  
"‏بعيداً عن كل ما ابعدك عنياشتقت لك🥺💕",  
"‏و اللـه و الوطــن 🇮🇶وعيون محبوبي❤️🤭",  
"‏الله يديم قربك الله يملي كل ايامي فيك 💕",  
"‏‏انّغلبت عند عُيونِك انهزمْت هزيمَة حُب",  
"‏‏حَبيت حُضنَك واني محاضنتَك تخيل؟♥️🕊",  
"‏‏الحب مثل الحرب يرادله زلم ❤️🧚‍♂️",  
"‏‏‏﮼قلبييالمغرمهـوآك ﮼خلنيابقىٰمعآك❤️",  
"‏‏‏ڪَــلبي وياك مو عندي🥺💞❤️",  
"في طريقي الف شخصوفي عيني انت وحدك ❤️",  
"سأختارك دائما وكأنك الوحيد والأبدي 💛💛",  
"‏‏‏: ﺂنَت؏َـالمي ﺂلمصنوَ؏ مَن البهجه 🤍",  
"‏‏‏ٱنتَ فكرتي الأولى عندما أستيقظ ♥️🔐",  
"‏‏‏دحبني و خل انام الليلّ مثل الناس ♥️🔐",  
"‏‏‏توة راد يسولف البرحي بحلاتك وانسحن گلبة وسكت 💙",  
"‏‏‏أول الاحباب انتِ واخر الاحباب صوتك 🖤",  
"‏‏‏لقد ملكتَني أكثر ممّا أظُن وأكثر ممّا تظُن♥️",  
"‏‏‏مثل تُحفه تُراثيه شما يُمر الزمن تِغلى هالبنيه ♥️",  
"‏‏‏اكسـرلج زلم فوك الزلم نسوان اذا واحد تدنالج 😊♥️",  
"‏‏‏‏بكل أغنيه حلوه اغمض عيوني وأتخيلك♥️",  
"‏‏‏‏مو تحبهم شعجب ما حسو بهمك ☹️🖤♥️",  
"‏‏‏‏ ‏لقد كنت معزولاً ووحيدًا في كل مكان مُبهجـة حتى ظِلها ڪانَ مُلونـاً",  
"‏‏‏‏ ‏من ظَلمة عيونك والشَمس رُمحين جَلجَل ليلهن واتحَزمن بالشر 😌♥️",  
"‏‏‏‏ ‏چـم زلـة منك بَينت وما جيت آعاتب ♥️",  
"‏‏‏‏ ‏العّشتهن وحَدي مَحد حاس بيهّن 🖤ْ",  
"‏‏‏‏ ‏منين أجيب گليب يتحمل حِزن 🥺منين أجيب عيون ماتعرف تحنّ 💔",  
"‏‏‏‏ ‏انا الملاكـ وهن بقايا الريشَ المتساقط من اجنحتي 😌❤️",  
"‏‏‏‏ ‏خلص صبري وجمالك حيل شدني ومثل خيط الوبر خداه شدني يگلي ادني لحد شفتاي شدني شدني من الذنوب طنون بيه",  
"‏‏‏‏ ‏حلوه الدنيا لو كل القلوب انضاف ولاكن خربته الوادم الوصخه",  
"‏‏‏‏ ‏العدهه هيج اعيون خضره و وسيعةانطيهاحتى الروح والبيت ابيعه",  
"‏‏‏‏ ‏وين القه ثوب أيوب وشلون احصله بلكت صبر بي ضال واخذلي وصله",  
"انتِي بس وافقي وانا والله لعيشك ملكه 😍",  
"موكد جمر بالروح هجرك جواني حد ما طلع عطابكلبي امنذاني",  
"ياطير المحنه هم سمعت بطير ماهزه الحنين لديرته وعشه",  
"راجع بـ طرگ المواجع حيل أطگ راسي بشبابيچك ندّم",  
"حسبـالي مثلي تحــن لو بينــت تعبـي غيمه وطردها الهوى هيج انطرد ڪلبي",  
"نرجع ونگول مُطرموسيقىٰ وحضنك يداده",  
"گودني لـ گلبَك واخِذنيالناس ما بيهُم وطَن",  
"تهزمني ؏ـيونكہَ كل مَا نويت اقسَى 🎋",  
"عانِقڼي٘ بـَ ﭑغنيةهَ لعَلڼا نلتِقي٘ علىَ ﭑطِݛافۿا",  
"كيف احتضنك حتى لا تنام حزينًا ولا وحيدًا ولا خائفًا وبيننا مسافة الأرض",  
"كيف ما احبك واسعد أوقاتي معاك 🤎؟*",  
"قنوعه بكُلشي إلا بيكّ أكبر انانيه♥️🥺",  
"حـب عظيم لڪل لحظه جمـيله بيني وبينڪ🌼",  
"أنت القصة التي لا أريد أن تكون لها نهاية 💞💍",  
"ولا شي يشبهك انت اجمل ماشافت عيوني🤍",  
"ٱحبـڪَ لِـحَد ما يعجز ڪَلامَـي",  
"يا حِݪوتهن ڪُل حلوه بصفچ مو حݪوه 🤍📮",  
"احبك نيابة ؏ـّن ڪل عناق فائت وعن ڪل مسافة منعت يداي من ملامسة وجهكَ",  
"غير عيونَك آني شعندي",  
"رَد بارد حضنّا وما حضناك",  
"يا حبيبة قلبي انتي يابعد ناسي وهلي",  
"وحدك اريدك تملي دنيايه وين اكو بگدي يحبك هوايه",  
"يا عمي عدها خدود والكعبة تنعض والشفة مو ستين لا بيها الف حظ",  
"انتَ عَينيونضر عَيني♡",  
"ترفهَ والخَجل نايم عَلى أطراف الجّفن كُحِلة 🤎",  
"فدوة لـ حچيك شگد ينحب ‏الهوا يدخل بريتك يطلع مرتب 📮🤍",  
"‏أرغبُ بأحتضانك لمده لاتقل عن ليلة كامله",  
"‏خَصر امرايةَ خُصرچ يَجرح الشوف",  
"‏متت لمَن شفت عينچ شَحچيلك ع عِيونها",  
"‏يالجنج كمَر نص ليل يطر الغيم ويضوي",  
"‏وكان الجمال لم يعرف طريقاً الا لكِ🖤",  
"‏دڪــافي نسولف مــن بعيد اريد اشكيلك مشابگ",  
"‏وينك يا دفـو يا جمر الاحزان احس بـدمي بـ الشريان جامد",  
"‏الدفء لا يقتَصر على ضوء الشمسحُضنكَ خيارٌ آخر💞💞💞💞💞💞",  
"‏شحچي عنك ‏كـلشي بالدنيا حلو مخلوق منّك♥️",  
"‏اكلك الحنيّة يلي بعيونك شلون تنباس♥️",  
"‏سنكون معاً ذات ليلة ممطرة",  
"‏انتَ والأغاني بڪُل وڪت مَرغوبين 🤍",  
"گد ما بوجهك ضوى شكيت بيك وگلت بالشمس متلثم",  

} 
return LuaTele.sendText(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
end
end
if text == "خيرني" or text == "لو خيروك" or text == "خيروك" then 
if Redis:get(itsspider.."spider:Status:Games"..msg.chat_id) then
local texting = {"لو خيروك |  بين الإبحار لمدة أسبوع كامل أو السفر على متن طائرة لـ 3 أيام متواصلة؟ ",
"لو خيروك |  بين شراء منزل صغير أو استئجار فيلا كبيرة بمبلغ معقول؟ ",
"لو خيروك |  أن تعيش قصة فيلم هل تختار الأكشن أو الكوميديا؟ ",
"لو خيروك |  بين تناول البيتزا وبين الايس كريم وذلك بشكل دائم؟ ",
"لو خيروك |  بين إمكانية تواجدك في الفضاء وبين إمكانية تواجدك في البحر؟ ",
"لو خيروك |  بين تغيير وظيفتك كل سنة أو البقاء بوظيفة واحدة طوال حياتك؟ ",
"لو خيروك |  أسئلة محرجة أسئلة صراحة ماذا ستختار؟ ",
"لو خيروك |  بين الذهاب إلى الماضي والعيش مع جدك أو بين الذهاب إلى المستقبل والعيش مع أحفادك؟ ",
"لو كنت شخص اخر هل تفضل البقاء معك أم أنك ستبتعد عن نفسك؟ ",
"لو خيروك |  بين الحصول على الأموال في عيد ميلادك أو على الهدايا؟ ",
"لو خيروك |  بين القفز بمظلة من طائرة أو الغوص في أعماق البحر؟ ",
"لو خيروك |  بين الاستماع إلى الأخبار الجيدة أولًا أو الاستماع إلى الأخبار السيئة أولًا؟ ",
"لو خيروك |  بين أن تكون رئيس لشركة فاشلة أو أن تكون موظف في شركة ناجحة؟ ",
"لو خيروك |  بين أن يكون لديك جيران صاخبون أو أن يكون لديك جيران فضوليون؟ ",
"لو خيروك |  بين أن تكون شخص مشغول دائمًا أو أن تكون شخص يشعر بالملل دائمًا؟ ",
"لو خيروك |  بين قضاء يوم كامل مع الرياضي الذي تشجعه أو نجم السينما الذي تحبه؟ ",
"لو خيروك |  بين استمرار فصل الشتاء دائمًا أو بقاء فصل الصيف؟ ",
"لو خيروك |  بين العيش في القارة القطبية أو العيش في الصحراء؟ ",
"لو خيروك |  بين أن تكون لديك القدرة على حفظ كل ما تسمع أو تقوله وبين القدرة على حفظ كل ما تراه أمامك؟ ",
"لو خيروك |  بين أن يكون طولك 150 سنتي متر أو أن يكون 190 سنتي متر؟ ",
"لو خيروك |  بين إلغاء رحلتك تمامًا أو بقائها ولكن فقدان الأمتعة والأشياء الخاص بك خلالها؟ ",
"لو خيروك |  بين أن تكون اللاعب الأفضل في فريق كرة فاشل أو أن تكون لاعب عادي في فريق كرة ناجح؟ ",
"لو خيروك |  بين ارتداء ملابس البيت لمدة أسبوع كامل أو ارتداء البدلة الرسمية لنفس المدة؟ ",
"لو خيروك |  بين امتلاك أفضل وأجمل منزل ولكن في حي سيء أو امتلاك أسوأ منزل ولكن في حي جيد وجميل؟ ",
"لو خيروك |  بين أن تكون غني وتعيش قبل 500 سنة، أو أن تكون فقير وتعيش في عصرنا الحالي؟ ",
"لو خيروك |  بين ارتداء ملابس الغوص ليوم كامل والذهاب إلى العمل أو ارتداء ملابس جدك/جدتك؟ ",
"لو خيروك |  بين قص شعرك بشكل قصير جدًا أو صبغه باللون الوردي؟ ",
"لو خيروك |  بين أن تضع الكثير من الملح على كل الطعام بدون علم أحد، أو أن تقوم بتناول شطيرة معجون أسنان؟ ",
"لو خيروك |  بين قول الحقيقة والصراحة الكاملة مدة 24 ساعة أو الكذب بشكل كامل مدة 3 أيام؟ ",
"لو خيروك |  بين تناول الشوكولا التي تفضلها لكن مع إضافة رشة من الملح والقليل من عصير الليمون إليها أو تناول ليمونة كاملة كبيرة الحجم؟ ",
"لو خيروك |  بين وضع أحمر الشفاه على وجهك ما عدا شفتين أو وضع ماسكارا على شفتين فقط؟ ",
"لو خيروك |  بين الرقص على سطح منزلك أو الغناء على نافذتك؟ ",
"لو خيروك |  بين تلوين شعرك كل خصلة بلون وبين ارتداء ملابس غير متناسقة لمدة أسبوع؟ ",
"لو خيروك |  بين تناول مياه غازية مجمدة وبين تناولها ساخنة؟ ",
"لو خيروك |  بين تنظيف شعرك بسائل غسيل الأطباق وبين استخدام كريم الأساس لغسيل الأطباق؟ ",
"لو خيروك |  بين تزيين طبق السلطة بالبرتقال وبين إضافة البطاطا لطبق الفاكهة؟ ",
"لو خيروك |  بين اللعب مع الأطفال لمدة 7 ساعات أو الجلوس دون فعل أي شيء لمدة 24 ساعة؟ ",
"لو خيروك |  بين شرب كوب من الحليب أو شرب كوب من شراب عرق السوس؟ ",
"لو خيروك |  بين الشخص الذي تحبه وصديق الطفولة؟ ",
"لو خيروك |  بين أمك وأبيك؟ ",
"لو خيروك |  بين أختك وأخيك؟ ",
"لو خيروك |  بين نفسك وأمك؟ ",
"لو خيروك |  بين صديق قام بغدرك وعدوك؟ ",
"لو خيروك |  بين خسارة حبيبك/حبيبتك أو خسارة أخيك/أختك؟ ",
"لو خيروك |  بإنقاذ شخص واحد مع نفسك بين أمك أو ابنك؟ ",
"لو خيروك |  بين ابنك وابنتك؟ ",
"لو خيروك |  بين زوجتك وابنك/ابنتك؟ ",
"لو خيروك |  بين جدك أو جدتك؟ ",
"لو خيروك |  بين زميل ناجح وحده أو زميل يعمل كفريق؟ ",
"لو خيروك |  بين لاعب كرة قدم مشهور أو موسيقي مفضل بالنسبة لك؟ ",
"لو خيروك |  بين مصور فوتوغرافي جيد وبين مصور سيء ولكنه عبقري فوتوشوب؟ ",
"لو خيروك |  بين سائق سيارة يقودها ببطء وبين سائق يقودها بسرعة كبيرة؟ ",
"لو خيروك |  بين أستاذ اللغة العربية أو أستاذ الرياضيات؟ ",
"لو خيروك |  بين أخيك البعيد أو جارك القريب؟ ",
"لو خيروك |  يبن صديقك البعيد وبين زميلك القريب؟ ",
"لو خيروك |  بين رجل أعمال أو أمير؟ ",
"لو خيروك |  بين نجار أو حداد؟ ",
"لو خيروك |  بين طباخ أو خياط؟ ",
"لو خيروك |  بين أن تكون كل ملابس بمقاس واحد كبير الحجم أو أن تكون جميعها باللون الأصفر؟ ",
"لو خيروك |  بين أن تتكلم بالهمس فقط طوال الوقت أو أن تصرخ فقط طوال الوقت؟ ",
"لو خيروك |  بين أن تمتلك زر إيقاف موقت للوقت أو أن تمتلك أزرار للعودة والذهاب عبر الوقت؟ ",
"لو خيروك |  بين أن تعيش بدون موسيقى أبدًا أو أن تعيش بدون تلفاز أبدًا؟ ",
"لو خيروك |  بين أن تعرف متى سوف تموت أو أن تعرف كيف سوف تموت؟ ",
"لو خيروك |  بين العمل الذي تحلم به أو بين إيجاد شريك حياتك وحبك الحقيقي؟ ",
"لو خيروك |  بين معاركة دب أو بين مصارعة تمساح؟ ",
"لو خيروك |  بين إما الحصول على المال أو على المزيد من الوقت؟ ",
"لو خيروك |  بين امتلاك قدرة التحدث بكل لغات العالم أو التحدث إلى الحيوانات؟ ",
"لو خيروك |  بين أن تفوز في اليانصيب وبين أن تعيش مرة ثانية؟ ",
"لو خيروك |  بأن لا يحضر أحد إما لحفل زفافك أو إلى جنازتك؟ ",
"لو خيروك |  بين البقاء بدون هاتف لمدة شهر أو بدون إنترنت لمدة أسبوع؟ ",
"لو خيروك |  بين العمل لأيام أقل في الأسبوع مع زيادة ساعات العمل أو العمل لساعات أقل في اليوم مع أيام أكثر؟ ",
"لو خيروك |  بين مشاهدة الدراما في أيام السبعينيات أو مشاهدة الأعمال الدرامية للوقت الحالي؟ ",
"لو خيروك |  بين التحدث عن كل شيء يدور في عقلك وبين عدم التحدث إطلاقًا؟ ",
"لو خيروك |  بين مشاهدة فيلم بمفردك أو الذهاب إلى مطعم وتناول العشاء بمفردك؟ ",
"لو خيروك |  بين قراءة رواية مميزة فقط أو مشاهدتها بشكل فيلم بدون القدرة على قراءتها؟ ",
"لو خيروك |  بين أن تكون الشخص الأكثر شعبية في العمل أو المدرسة وبين أن تكون الشخص الأكثر ذكاءً؟ ",
"لو خيروك |  بين إجراء المكالمات الهاتفية فقط أو إرسال الرسائل النصية فقط؟ ",
"لو خيروك |  بين إنهاء الحروب في العالم أو إنهاء الجوع في العالم؟ ",
"لو خيروك |  بين تغيير لون عينيك أو لون شعرك؟ ",
"لو خيروك |  بين امتلاك كل عين لون وبين امتلاك نمش على خديك؟ ",
"لو خيروك |  بين الخروج بالمكياج بشكل مستمر وبين الحصول على بشرة صحية ولكن لا يمكن لك تطبيق أي نوع من المكياج؟ ",
"لو خيروك |  بين أن تصبحي عارضة أزياء وبين ميك اب أرتيست؟ ",
"لو خيروك |  بين مشاهدة كرة القدم أو متابعة الأخبار؟ ",
"لو خيروك |  بين موت شخصية بطل الدراما التي تتابعينها أو أن يبقى ولكن يكون العمل الدرامي سيء جدًا؟ ",
"لو خيروك |  بين العيش في دراما قد سبق وشاهدتها ماذا تختارين بين الكوميديا والتاريخي؟ ",
"لو خيروك |  بين امتلاك القدرة على تغيير لون شعرك متى تريدين وبين الحصول على مكياج من قبل خبير تجميل وذلك بشكل يومي؟ ",
"لو خيروك |  بين نشر تفاصيل حياتك المالية وبين نشر تفاصيل حياتك العاطفية؟ ",
"لو خيروك |  بين البكاء والحزن وبين اكتساب الوزن؟ ",
"لو خيروك |  بين تنظيف الأطباق كل يوم وبين تحضير الطعام؟ ",
"لو خيروك |  بين أن تتعطل سيارتك في نصف الطريق أو ألا تتمكنين من ركنها بطريقة صحيحة؟ ",
"لو خيروك |  بين إعادة كل الحقائب التي تملكينها أو إعادة الأحذية الجميلة الخاصة بك؟ ",
"لو خيروك |  بين قتل حشرة أو متابعة فيلم رعب؟ ",
"لو خيروك |  بين امتلاك قطة أو كلب؟ ",
"لو خيروك |  بين الصداقة والحب ",
"لو خيروك |  بين تناول الشوكولا التي تحبين طوال حياتك ولكن لا يمكنك الاستماع إلى الموسيقى وبين الاستماع إلى الموسيقى ولكن لا يمكن لك تناول الشوكولا أبدًا؟ ",
"لو خيروك |  بين مشاركة المنزل مع عائلة من الفئران أو عائلة من الأشخاص المزعجين الفضوليين الذين يتدخلون في كل كبيرة وصغيرة؟ ",
} 
return LuaTele.sendText(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
end
end
if text == "حروف" or text == "حرف" or text == "الحروف" then 
if Redis:get(itsspider.."spider:Status:Games"..msg.chat_id) then
local texting = {" جماد بحرف ↫ ر  ", 
" مدينة بحرف ↫ ع  ",
" حيوان ونبات بحرف ↫ خ  ", 
" اسم بحرف ↫ ح  ", 
" اسم ونبات بحرف ↫ م  ", 
" دولة عربية بحرف ↫ ق  ", 
" جماد بحرف ↫ ي  ", 
" نبات بحرف ↫ ج  ", 
" اسم بنت بحرف ↫ ع  ", 
" اسم ولد بحرف ↫ ع  ", 
" اسم بنت وولد بحرف ↫ ث  ", 
" جماد بحرف ↫ ج  ",
" حيوان بحرف ↫ ص  ",
" دولة بحرف ↫ س  ",
" نبات بحرف ↫ ج  ",
" مدينة بحرف ↫ ب  ",
" نبات بحرف ↫ ر  ",
" اسم بحرف ↫ ك  ",
" حيوان بحرف ↫ ظ  ",
" جماد بحرف ↫ ذ  ",
" مدينة بحرف ↫ و  ",
" اسم بحرف ↫ م  ",
" اسم بنت بحرف ↫ خ  ",
" اسم و نبات بحرف ↫ ر  ",
" نبات بحرف ↫ و  ",
" حيوان بحرف ↫ س  ",
" مدينة بحرف ↫ ك  ",
" اسم بنت بحرف ↫ ص  ",
" اسم ولد بحرف ↫ ق  ",
" نبات بحرف ↫ ز  ",
"  جماد بحرف ↫ ز  ",
"  مدينة بحرف ↫ ط  ",
"  جماد بحرف ↫ ن  ",
"  مدينة بحرف ↫ ف  ",
"  حيوان بحرف ↫ ض  ",
"  اسم بحرف ↫ ك  ",
"  نبات و حيوان و مدينة بحرف ↫ س  ", 
"  اسم بنت بحرف ↫ ج  ", 
"  مدينة بحرف ↫ ت  ", 
"  جماد بحرف ↫ ه  ", 
"  اسم بنت بحرف ↫ ر  ", 
" اسم ولد بحرف ↫ خ  ", 
" جماد بحرف ↫ ع  ",
" حيوان بحرف ↫ ح  ",
" نبات بحرف ↫ ف  ",
" اسم بنت بحرف ↫ غ  ",
" اسم ولد بحرف ↫ و  ",
" نبات بحرف ↫ ل  ",
"مدينة بحرف ↫ ع  ",
"دولة واسم بحرف ↫ ب  ",
} 
return LuaTele.sendText(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
end
end
if text == "كتبات" or text == "حكمه" or text == "قصيده" then 
if Redis:get(itsspider.."spider:Status:Games"..msg.chat_id) then
local vBandav_Msg = { 
"‏من ترك أمرهُ لله، أعطاه الله فوق ما يتمنَّاه💙 ", 
"‏من علامات جمال المرأة .. بختها المايل ! ",
"‏ انك الجميع و كل من احتل قلبي🫀🤍",
"‏ ‏ لقد تْعَمقتُ بكَ كَثيراً والمِيمُ لام .♥️",
"‏ ‏ممكن اكون اختارت غلط بس والله حبيت بجد🖇️",
"‏ علينا إحياء زَمن الرّسائل الورقيّة وسط هذه الفوضى الالكترونية العَارمة. ⌁ : 💜",
"‏ يجي اي الصاروخ الصيني ده جمب الصاروخ المصري لما بيلبس العبايه السوده.🤩♥️",
"‏ كُنت أرقّ من أن أتحمّل كُل تلك القَسوة من عَينيك .🍍",
"‏أَكَان عَلَيَّ أَنْ أغْرَس انيابي فِي قَلْبِك لتشعر بِي ؟.",
"‏ : كُلما أتبع قلبي يدلني إليك .",
"‏ : أيا ليت من تَهواه العينُ تلقاهُ .",
"‏ ‏: رغبتي في مُعانقتك عميقة جداً .??",
"ويُرهقني أنّي مليء بما لا أستطيع قوله.✨",
"‏ من مراتب التعاسه إطالة الندم ع شيء إنتهى. ⌁ : ",
"‏ ‏كل العالم يهون بس الدنيا بينا تصفي 💙",
"‏ بعض الاِعتذارات يجب أن تُرفَضّ.",
"‏ ‏تبدأ حياتك محاولاً فهم كل شيء، وتنهيها محاولاً النجاة من كل ما فهمت.",
"‏ إن الأمر ينتهي بِنا إلى أعتياد أي شيء.",
"‏ هل كانت كل الطرق تؤدي إليكِ، أم أنني كنتُ أجعلها كذلك.",
"‏ ‏هَتفضل توآسيهُم وآحد ورآ التآني لكن أنتَ هتتنسي ومحدِش هَيوآسيك.",
"‏ جَبَرَ الله قلوبِكُم ، وقَلبِي .🍫",
"‏ بس لما أنا ببقى فايق، ببقى أبكم له ودان.💖",
"‏ ‏مقدرش عالنسيان ولو طال الزمن 🖤",
"‏ أنا لستُ لأحد ولا احد لي ، أنا إنسان غريب أساعد من يحتاجني واختفي.",
"‏ ‏أحببتك وأنا منطفئ، فما بالك وأنا في كامل توهجي ؟",
"‏ لا تعودني على دفء شمسك، إذا كان في نيتك الغروب .َ",
"‏ وانتهت صداقة الخمس سنوات بموقف.",
"‏ ‏لا تحب أحداً لِدرجة أن تتقبّل أذاه.",
"‏ إنعدام الرّغبة أمام الشّيء الّذي أدمنته ، انتصار.",
"‏مش جايز , ده اكيد التأخير وارهاق القلب ده وراه عوضاً عظيماً !💙 ",
" مش جايز , ده اكيد التأخير وارهاق القلب ده وراه عوضاً عظيماً !💙",
"فـ بالله صبر  وبالله يسر وبالله عون وبالله كل شيئ ♥️. ",
"أنا بعتز بنفسي جداً كصاحب وشايف اللي بيخسرني ، بيخسر أنضف وأجدع شخص ممكن يشوفه . ",
"فجأه جاتلى قافله ‏خلتنى مستعد أخسر أي حد من غير ما أندم عليه . ",
"‏اللهُم قوني بك حين يقِل صبري... ",
"‏يارب سهِل لنا كُل حاجة شايلين هَمها 💙‏ ",
"انا محتاج ايام حلوه بقي عشان مش نافع كدا ! ",
"المشكله مش اني باخد قررات غلط المشكله اني بفكر كويس فيها قبل ما اخدها .. ",
"تخيل وانت قاعد مخنوق كدا بتفكر فالمزاكره اللي مزكرتهاش تلاقي قرار الغاء الدراسه .. ",
" مكانوش يستحقوا المعافرة بأمانه.",
"‏جمل فترة في حياتي، كانت مع اكثر الناس الذين أذتني نفسيًا. ",
" ‏إحنا ليه مبنتحبش يعني فينا اي وحش!",
"أيام مُمله ومستقبل مجهول ونومٌ غير منتظموالأيامُ تمرُ ولا شيَ يتغير ", 
"عندما تهب ريح المصلحه سوف ياتي الجميع رتكدون تحت قدمك ❤️. ",
"عادي مهما تعادي اختك قد الدنيا ف عادي ❤. ",
"بقيت لوحدي بمعنا اي انا اصلا من زمان لوحدي.❤️ ",
"- ‏تجري حياتنا بما لاتشتهي أحلامنا ! ",
"تحملين كل هذا الجمال، ‏ألا تتعبين؟",
"البدايات للكل ، والثبات للصادقين ",
"مُؤخرًا اقتنعت بالجملة دي جدا : Private life always wins. ",
" الافراط في التسامح بيخللي الناس تستهين بيك🍍",
"مهما كنت كويس فـَ إنت معرض لـِ الاستبدال.. ",
"فخوره بنفسي جدًا رغم اني معملتش حاجه فـ حياتي تستحق الذكر والله . ",
"‏إسمها ليلة القدر لأنها تُغير الأقدار ,اللهُمَّ غير قدري لحالٍ تُحبه وعوضني خير .. ",
"فى احتمال كبير انها ليلة القدر ادعوا لنفسكم كتير وأدعو ربنا يشفى كل مريض. 💙 ",
"أنِر ظُلمتي، وامحُ خطيئتي، واقبل توبتي وأعتِق رقبتي يا اللّٰه. إنكَ عفوٌّ تُحِبُّ العفوَ؛ فاعفُ عني 💛 ", 
} 
return LuaTele.sendText(msg_chat_id,msg_id,vBandav_Msg[math.random(#vBandav_Msg)],'md')
end
end
if text == "انصحني" or text == "انصحنى" or text == "انصح" then 
if Redis:get(itsspider.."spider:Status:Games"..msg.chat_id) then
local vBandav_Msg = { 
"عامل الناس بأخلاقك ولا بأخلاقهم", 
"الجمال يلفت الأنظار لكن الطيبه تلفت القلوب ", 
"الاعتذار عن الأخطاء لا يجرح كرامتك بل يجعلك كبير في نظر الناس ",
"لا ترجي السماحه من بخيل.. فما في البار لظمان ماء",
"لا تحقرون صغيره إن الجبال من الحصي",
"لا تستحي من إعطاء فإن الحرمان أقل منه ", 
"لا تظلم حتى لا تتظلم ",
"لا تقف قصاد الريح ولا تمشي معها ",
"لا تكسب موده التحكم الا بالتعقل",
"لا تمد عينك في يد غيرك ",
"لا تملح الا لمن يستحقاها ويحافظ عليها",
"لا حياه للإنسان بلا نبات",
"لا حياه في الرزق.. ولا شفاعه في الموت",
"كما تدين تدان",
"لا دين لمن لا عهد له ",
"لا سلطان على الدوق فيما يحب أو بكره",
"لا مروه لمن لادين له ",
"لا يدخل الجنه من لايأمن من جازه بوائقه",
"يسروا ولا تعسروا... ويشورا ولا تنفروا",
"يدهم الصدر ما يبني العقل الواسع ",
"أثقل ما يوضع في الميزان يوم القيامة حسن الخلق ",
"أجهل الناس من ترك يقين ما عنده لظن ما عند الناس ",
"أحياناً.. ويصبح الوهم حقيقه ",
"مينفعش تعاتب حد مبيعملش حساب لزعلك عشان متزعلش مرتين . ",
"السفر ومشاهده اماكن مختلفه وجديده ",
"عدم تضيع الفرص واسثمارها لحظه مجبئها ",
" اعطاء الاخرين اكثر من ما يتوقعون",
"معامله الناس بلطف ولكن عدم السماح لاحد بستغالال ذالك ",
"تكوين صدقات جديده مع الحفظ بلاصدقاء القودامي ",
"تعلم اصول المهنه بدلا من تضيع الوقت ف تعلم حيل المهنه ",
"مدح ع الاقل ثلاث اشخاص يوميا ",
"النظر ف عيون الشخاص عند مخاطبتهم ",
"التحلي بلسماح مع الاخرين او النفس ",
"الاكثار من قول كلمه شكرا ",
" مصافحه الاخرين بثبات وقوة ",
"الابتعاد عن المناطق السيئه السمعه لتجنب الاحداث السئه ",
" ادخار 10٪ع الاقل من الدخل",
" تجنب المخاوف من خلال التعلم من تجارب مختلفه",
" الحفاظ ع السمعه لانها اغلي ما يملك الانسان",
" تحويل الاعداء الي اصدقاء من خلال القيام بعمل جيد",
"لا تصدق كل ما تسمعع. ولا تنفق كل ما تمتلك . ولا تنم قدر ما ترغب ",
" اعتني بسمعتك جيدا فستثبت للك الايام انها اغلي ما تملك",
"حين تقول والدتك ستندم ع فعل ذالك ستندم عليه غالبا.. ",
" لا تخش العقبات الكبيره فخلفها تقع الفرص العظيمه",
"قد لا يتطلب الامر اكثر من شخص واحد لقلب حياتك رأس ع عقب ",
"اختر رفيقه حياتك بحرص فهو قرار سيشكل 90٪من سعادتك او بؤسك ",
" اقلب اداءك الاصدقاء بفعل شي جميل ومفجائ لهم",
"حين تدق الفرصه ع باباك ادعوها للبيت ",
"تعلم القواعد جيدا ثن اكسر بعدها ",
"احكم ع نجاحك من خلال قدرتك ع العطاء وليس الاخذ ",
" لا تتجاهل الشيطان مهما بدل ثيابه",
"ركز ع جعل الاشياء افضل وليس اكبر او اعظم ",
"كن سعيد  بما تمتلك واعمل لامتلاك ما تريد ",
"اعط الناس اكثر من ما يتوقعون ",
" لا تكن منشغل لدرجه عدم التعرف ع اصدقاء جدد",
"استحمه يوم العيد يمعفن🤓",
"مش تحب اي حد يقرب منك ",
" خليك مع البت راجل خليك تقيل🥥",
" انصح نفسك بنفسك بمت😆",
" كنت نصحت نفسي ياخويا😹", 
} 
return LuaTele.sendText(msg_chat_id,msg_id,vBandav_Msg[math.random(#vBandav_Msg)],'md')
end
end
if text == "اعلام" or text == "اعلام ودول" or text == "اعلام و دول" or text == "دول" then
if Redis:get(itsspider.."spider:Status:Games"..msg.chat_id) then
Redis:del(itsspider.."spider:Set:Country"..msg.chat_id)
Country_Rand = {"مصر","العراق","السعوديه","المانيا","تونس","الجزائر","فلسطين","اليمن","المغرب","البحرين","فرنسا","سويسرا","تركيا","انجلترا","الولايات المتحده","كندا","الكويت","ليبيا","السودان","سوريا"}
name = Country_Rand[math.random(#Country_Rand)]
Redis:set(itsspider.."spider:Game:Countrygof"..msg.chat_id,name)
name = string.gsub(name,"مصر","🇪🇬")
name = string.gsub(name,"العراق","🇮🇶")
name = string.gsub(name,"السعوديه","🇸🇦")
name = string.gsub(name,"المانيا","🇩🇪")
name = string.gsub(name,"تونس","🇹🇳")
name = string.gsub(name,"الجزائر","🇩🇿")
name = string.gsub(name,"فلسطين","🇵🇸")
name = string.gsub(name,"اليمن","🇾🇪")
name = string.gsub(name,"المغرب","🇲🇦")
name = string.gsub(name,"البحرين","🇧🇭")
name = string.gsub(name,"فرنسا","🇫🇷")
name = string.gsub(name,"سويسرا","🇨🇭")
name = string.gsub(name,"انجلترا","🇬🇧")
name = string.gsub(name,"تركيا","🇹🇷")
name = string.gsub(name,"الولايات المتحده","🇱🇷")
name = string.gsub(name,"كندا","🇨🇦")
name = string.gsub(name,"الكويت","🇰🇼")
name = string.gsub(name,"ليبيا","🇱🇾")
name = string.gsub(name,"السودان","🇸🇩")
name = string.gsub(name,"سوريا","🇸🇾")
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ :  اسرع واحد يرسل اسم الدولة ~ {"..name.."}","md",true)  
end
end
if text == "الاسرع" or tect == "ترتيب" then
if Redis:get(itsspider.."spider:Status:Games"..msg.chat_id) then
KlamSpeed = {"سحور","سياره","استقبال","قنفه","ايفون","بزونه","مطبخ","كرستيانو","دجاجه","مدرسه","الوان","غرفه","ثلاجه","كهوه","سفينه","العراق","محطه","طياره","رادار","منزل","مستشفى","كهرباء","تفاحه","اخطبوط","سلمون","فرنسا","برتقاله","تفاح","مطرقه","بتيته","لهانه","شباك","باص","سمكه","ذباب","تلفاز","حاسوب","انترنيت","ساحه","جسر"};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(itsspider.."spider:Game:Monotonous"..msg.chat_id,name)
name = string.gsub(name,"سحور","س ر و ح")
name = string.gsub(name,"سياره","ه ر س ي ا")
name = string.gsub(name,"استقبال","ل ب ا ت ق س ا")
name = string.gsub(name,"قنفه","ه ق ن ف")
name = string.gsub(name,"ايفون","و ن ف ا")
name = string.gsub(name,"بزونه","ز و ه ن")
name = string.gsub(name,"مطبخ","خ ب ط م")
name = string.gsub(name,"كرستيانو","س ت ا ن و ك ر ي")
name = string.gsub(name,"دجاجه","ج ج ا د ه")
name = string.gsub(name,"مدرسه","ه م د ر س")
name = string.gsub(name,"الوان","ن ا و ا ل")
name = string.gsub(name,"غرفه","غ ه ر ف")
name = string.gsub(name,"ثلاجه","ج ه ت ل ا")
name = string.gsub(name,"كهوه","ه ك ه و")
name = string.gsub(name,"سفينه","ه ن ف ي س")
name = string.gsub(name,"العراق","ق ع ا ل ر ا")
name = string.gsub(name,"محطه","ه ط م ح")
name = string.gsub(name,"طياره","ر ا ط ي ه")
name = string.gsub(name,"رادار","ر ا ر ا د")
name = string.gsub(name,"منزل","ن ز م ل")
name = string.gsub(name,"مستشفى","ى ش س ف ت م")
name = string.gsub(name,"كهرباء","ر ب ك ه ا ء")
name = string.gsub(name,"تفاحه","ح ه ا ت ف")
name = string.gsub(name,"اخطبوط","ط ب و ا خ ط")
name = string.gsub(name,"سلمون","ن م و ل س")
name = string.gsub(name,"فرنسا","ن ف ر س ا")
name = string.gsub(name,"برتقاله","ر ت ق ب ا ه ل")
name = string.gsub(name,"تفاح","ح ف ا ت")
name = string.gsub(name,"مطرقه","ه ط م ر ق")
name = string.gsub(name,"بتيته","ب ت ت ي ه")
name = string.gsub(name,"لهانه","ه ن ل ه ل")
name = string.gsub(name,"شباك","ب ش ا ك")
name = string.gsub(name,"باص","ص ا ب")
name = string.gsub(name,"سمكه","ك س م ه")
name = string.gsub(name,"ذباب","ب ا ب ذ")
name = string.gsub(name,"تلفاز","ت ف ل ز ا")
name = string.gsub(name,"حاسوب","س ا ح و ب")
name = string.gsub(name,"انترنيت","ا ت ن ر ن ي ت")
name = string.gsub(name,"ساحه","ح ا ه س")
name = string.gsub(name,"جسر","ر ج س")
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : اسرع واحد يرتبها ↫ ‹ "..name.." ›","md",true) end end
if text == "حزوره" then
if Redis:get(itsspider.."spider:Status:Games"..msg.chat_id) then
Hzora = {"الجرس","عقرب الساعه","السمك","المطر","5","الكتاب","البسمار","7","الكعبه","بيت الشعر","لهانه","انا","امي","الابره","الساعه","22","غلط","كم الساعه","البيتنجان","البيض","المرايه","الضوء","الهواء","الضل","العمر","القلم","المشط","الحفره","البحر","الثلج","الاسفنج","الصوت","بلم"};
name = Hzora[math.random(#Hzora)]
Redis:set(itsspider.."spider:Game:Riddles"..msg.chat_id,name)
name = string.gsub(name,"الجرس","شيئ اذا لمسته صرخ ما هوه ؟")
name = string.gsub(name,"عقرب الساعه","اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟")
name = string.gsub(name,"السمك","ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟")
name = string.gsub(name,"المطر","شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟")
name = string.gsub(name,"5","ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ")
name = string.gsub(name,"الكتاب","ما الشيئ الذي له اوراق وليس له جذور ؟")
name = string.gsub(name,"البسمار","ما هو الشيئ الذي لا يمشي الا بالضرب ؟")
name = string.gsub(name,"7","عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ")
name = string.gsub(name,"الكعبه","ما هو الشيئ الموجود وسط مكة ؟")
name = string.gsub(name,"بيت الشعر","ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟")
name = string.gsub(name,"لهانه","وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ")
name = string.gsub(name,"انا","ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟")
name = string.gsub(name,"امي","اخت خالك وليست خالتك من تكون ؟")
name = string.gsub(name,"الابره","ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟")
name = string.gsub(name,"الساعه","ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟")
name = string.gsub(name,"22","كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ")
name = string.gsub(name,"غلط","ما هي الكلمه الوحيده التي تلفض غلط دائما ؟")
name = string.gsub(name,"كم الساعه","ما هو السؤال الذي تختلف اجابته دائما ؟")
name = string.gsub(name,"البيذنجان","جسم اسود وقلب ابيض وراس اخظر فما هو ؟")
name = string.gsub(name,"البيض","ماهو الشيئ الذي اسمه على لونه ؟")
name = string.gsub(name,"المرايه","ارى كل شيئ من دون عيون من اكون ؟")
name = string.gsub(name,"الضوء","ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟")
name = string.gsub(name,"الهواء","ما هو الشيئ الذي يسير امامك ولا تراه ؟")
name = string.gsub(name,"الضل","ما هو الشيئ الذي يلاحقك اينما تذهب ؟")
name = string.gsub(name,"العمر","ما هو الشيء الذي كلما طال قصر ؟")
name = string.gsub(name,"القلم","ما هو الشيئ الذي يكتب ولا يقرأ ؟")
name = string.gsub(name,"المشط","له أسنان ولا يعض ما هو ؟")
name = string.gsub(name,"الحفره","ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟")
name = string.gsub(name,"البحر","ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟")
name = string.gsub(name,"الثلج","انا ابن الماء فان تركوني في الماء مت فمن انا ؟")
name = string.gsub(name,"الاسفنج","كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟")
name = string.gsub(name,"الصوت","اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟")
name = string.gsub(name,"بلم","حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟")
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : اسرع واحد يحل الحزوره ↓\n {"..name.."}","md",true) end end
if text == "معاني" then
if Redis:get(itsspider.."spider:Status:Games"..msg.chat_id) then
Redis:del(itsspider.."spider:Set:Maany"..msg.chat_id)
Maany_Rand = {"قرد","دجاجه","بطريق","ضفدع","بومه","نحله","ديك","جمل","بقره","دولفين","تمساح","قرش","نمر","اخطبوط","سمكه","خفاش","اسد","فأر","ذئب","فراشه","عقرب","زرافه","قنفذ","تفاحه","باذنجان"}
name = Maany_Rand[math.random(#Maany_Rand)]
Redis:set(itsspider.."spider:Game:Meaningof"..msg.chat_id,name)
name = string.gsub(name,"قرد","🐵")
name = string.gsub(name,"دجاجه","🐔")
name = string.gsub(name,"بطريق","🐧")
name = string.gsub(name,"ضفدع","🐸")
name = string.gsub(name,"بومه","🦉")
name = string.gsub(name,"نحله","🐝")
name = string.gsub(name,"ديك","🐓")
name = string.gsub(name,"جمل","🐫")
name = string.gsub(name,"بقره","🐄")
name = string.gsub(name,"دولفين","🐬")
name = string.gsub(name,"تمساح","🐊")
name = string.gsub(name,"قرش","🦈")
name = string.gsub(name,"نمر","🐅")
name = string.gsub(name,"اخطبوط","🐙")
name = string.gsub(name,"سمكه","🐟")
name = string.gsub(name,"خفاش","🦇")
name = string.gsub(name,"اسد","🦁")
name = string.gsub(name,"فأر","🐭")
name = string.gsub(name,"ذئب","🐺")
name = string.gsub(name,"فراشه","🦋")
name = string.gsub(name,"عقرب","🦂")
name = string.gsub(name,"زرافه","🦒")
name = string.gsub(name,"قنفذ","🦔")
name = string.gsub(name,"تفاحه","🍎")
name = string.gsub(name,"باذنجان","🍆")
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : اسرع واحد يدز معنى السمايل ↫ ‹ "..name.." ›","md",true) end end
if text == "العكس" then
if Redis:get(itsspider.."spider:Status:Games"..msg.chat_id) then
Redis:del(itsspider.."spider:Set:Aks"..msg.chat_id)
katu = {"باي","فهمت","موزين","اسمعك","احبك","موحلو","نضيف","حاره","ناصي","جوه","سريع","ونسه","طويل","سمين","ضعيف","شريف","شجاع","رحت","عدل","نشيط","شبعان","موعطشان","خوش ولد","اني","هادئ"}
name = katu[math.random(#katu)]
Redis:set(itsspider.."spider:Game:Reflection"..msg.chat_id,name)
name = string.gsub(name,"باي","هلو")
name = string.gsub(name,"فهمت","مافهمت")
name = string.gsub(name,"موزين","زين")
name = string.gsub(name,"اسمعك","ماسمعك")
name = string.gsub(name,"احبك","ماحبك")
name = string.gsub(name,"موحلو","حلو")
name = string.gsub(name,"نضيف","وصخ")
name = string.gsub(name,"حاره","بارده")
name = string.gsub(name,"ناصي","عالي")
name = string.gsub(name,"جوه","فوك")
name = string.gsub(name,"سريع","بطيء")
name = string.gsub(name,"ونسه","ضوجه")
name = string.gsub(name,"طويل","قزم")
name = string.gsub(name,"سمين","ضعيف")
name = string.gsub(name,"ضعيف","قوي")
name = string.gsub(name,"شريف","كواد")
name = string.gsub(name,"شجاع","جبان")
name = string.gsub(name,"رحت","اجيت")
name = string.gsub(name,"عدل","ميت")
name = string.gsub(name,"نشيط","كسول")
name = string.gsub(name,"شبعان","جوعان")
name = string.gsub(name,"موعطشان","عطشان")
name = string.gsub(name,"خوش ولد","موخوش ولد")
name = string.gsub(name,"اني","مطي")
name = string.gsub(name,"هادئ","عصبي")
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : اسرع واحد يدز العكس ↫ ‹ "..name.." ›","md",true) end end
if text == "بات" or text == "محيبس" then   
if Redis:get(itsspider.."spider:Status:Games"..msg.chat_id) then 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '👊', data = '/Mahibes1'}, {text = '👊🏻', data = '/Mahibes2'},},{{text = '👊🏼', data = '/Mahibes3'}, {text = '👊🏽', data = '/Mahibes4'},},{{text = '👊🏾', data = '/Mahibes5'}, {text = '👊🏿', data = '/Mahibes6'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, [[*
⌁ : لعبه المحيبس هي لعبة الحظ
⌁ : كل ما عليك هوا الضغط على احدى العضمات
*]],"md",false, false, false, false, reply_markup) end end
if text == "خمن" or text == "تخمين" then   
if Redis:get(itsspider.."spider:Status:Games"..msg.chat_id) then
Num = math.random(1,20)
Redis:set(itsspider.."spider:Game:Estimate"..msg.chat_id..msg.sender.user_id,Num)  
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : اهلا بك عزيزي في لعبة التخمين :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n".."⌁ : ملاحظه لديك {3} محاولات فقط فكر قبل ارسال تخمينك \n\n".."⌁ : سيتم تخمين عدد ما بين ال {1 و 20} اذا تعتقد انك تستطيع الفوز جرب واللعب الان ؟ ","md",true) end end
if text == "المختلف" then
if Redis:get(itsspider.."spider:Status:Games"..msg.chat_id) then
mktlf = {"😸","☠","🐼","🐇","🌑","🌚","⭐️","✨","⛈","🌥","⛄️","👨‍🔬","👨‍💻","👨‍🔧","👩‍🍳","🧚‍♀","🧜‍♂","🧝‍♂","🙍‍♂","🧖‍♂","👬","🕓","🕤","⌛️","📅",};
name = mktlf[math.random(#mktlf)]
Redis:set(itsspider.."spider:Game:Difference"..msg.chat_id,name)
name = string.gsub(name,"😸","😹😹😹😹😹😹😹😹😸😹😹😹😹")
name = string.gsub(name,"☠","💀💀💀💀💀💀💀☠💀💀💀💀💀")
name = string.gsub(name,"🐼","👻👻👻🐼👻👻👻👻👻👻👻")
name = string.gsub(name,"🐇","🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊")
name = string.gsub(name,"🌑","🌚🌚🌚🌚🌚🌑🌚🌚🌚")
name = string.gsub(name,"🌚","🌑🌑🌑🌑🌑🌚🌑🌑🌑")
name = string.gsub(name,"⭐️","🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟")
name = string.gsub(name,"✨","💫💫💫💫💫✨💫💫💫💫")
name = string.gsub(name,"⛈","🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨")
name = string.gsub(name,"🌥","⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️")
name = string.gsub(name,"⛄️","☃☃☃☃☃☃⛄️☃☃☃☃")
name = string.gsub(name,"👨‍🔬","👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬")
name = string.gsub(name,"👨‍💻","👩👩👩👩👩👨‍💻👩👩")
name = string.gsub(name,"👨‍🔧","👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧")
name = string.gsub(name,"👩‍🍳","👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳")
name = string.gsub(name,"🧚‍♀","🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂")
name = string.gsub(name,"🧜‍♂","🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♂🧜‍♀🧜‍♀🧜‍♀")
name = string.gsub(name,"🧝‍♂","🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀")
name = string.gsub(name,"🙍‍♂️","🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️")
name = string.gsub(name,"🧖‍♂️","🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️")
name = string.gsub(name,"👬","👭👭👭👭👭👬👭👭👭")
name = string.gsub(name,"👨‍👨‍👧","👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦")
name = string.gsub(name,"🕓","🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒")
name = string.gsub(name,"🕤","🕥🕥🕥🕥🕥🕤🕥??🕥")
name = string.gsub(name,"⌛️","⏳⏳⏳⏳⏳⏳⌛️⏳⏳")
name = string.gsub(name,"📅","📆📆📆📆📆📆📅📆📆")
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : اسرع واحد يدز الاختلاف ↫ ‹ "..name.." ›","md",true) end end
if text == "امثله" then
if Redis:get(itsspider.."spider:Status:Games"..msg.chat_id) then
mthal = {"جوز","ضراطه","الحبل","الحافي","شقره","بيدك","سلايه","النخله","الخيل","حداد","المبلل","يركص","قرد","العنب","العمه","الخبز","بالحصاد","شهر","شكه","يكحله",};
name = mthal[math.random(#mthal)]
Redis:set(itsspider.."spider:Game:Example"..msg.chat_id,name)
name = string.gsub(name,"جوز","ينطي____للماعده سنون")
name = string.gsub(name,"ضراطه","الي يسوق المطي يتحمل___")
name = string.gsub(name,"بيدك","اكل___محد يفيدك")
name = string.gsub(name,"الحافي","تجدي من___نعال")
name = string.gsub(name,"شقره","مع الخيل يا___")
name = string.gsub(name,"النخله","الطول طول___والعقل عقل الصخلة")
name = string.gsub(name,"سلايه","بالوجه امراية وبالظهر___")
name = string.gsub(name,"الخيل","من قلة___شدو على الچلاب سروج")
name = string.gsub(name,"حداد","موكل من صخم وجهه كال آني___")
name = string.gsub(name,"المبلل","___ما يخاف من المطر")
name = string.gsub(name,"الحبل","اللي تلدغة الحية يخاف من جرة___")
name = string.gsub(name,"يركص","المايعرف___يكول الكاع عوجه")
name = string.gsub(name,"العنب","المايلوح___يكول حامض")
name = string.gsub(name,"العمه","___إذا حبت الچنة ابليس يدخل الجنة")
name = string.gsub(name,"الخبز","انطي___للخباز حتى لو ياكل نصه")
name = string.gsub(name,"باحصاد","اسمة___ومنجله مكسور")
name = string.gsub(name,"شهر","امشي__ولا تعبر نهر")
name = string.gsub(name,"شكه","يامن تعب يامن__يا من على الحاضر لكة")
name = string.gsub(name,"القرد","__بعين امه غزال")
name = string.gsub(name,"يكحله","اجه___عماها")
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : اسرع واحد يكمل المثل ↫ ‹ "..name.." ›","md",true) end end
if text and text:match("^بيع مجوهراتي (%d+)$") then
local NumGame = text:match("^بيع مجوهراتي (%d+)$") 
if tonumber(NumGame) == tonumber(0) then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : لا استطيع البيع اقل من 1 *","md",true)  end
local NumberGame = Redis:get(itsspider.."spider:Num:Add:Games"..msg.chat_id..msg.sender.user_id)
if tonumber(NumberGame) == tonumber(0) then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ليس لديك جواهر من الالعاب \n⌁ : اذا كنت تريد ربح الجواهر \n⌁ : ارسل الالعاب وابدأ اللعب ! ","md",true)  end
if tonumber(NumGame) > tonumber(NumberGame) then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : ليس لديك جواهر بهذا العدد \n⌁ : لزيادة مجوهراتك في اللعبه \n⌁ : ارسل الالعاب وابدأ اللعب !","md",true)   
end
local NumberGet = (NumGame * 50)
Redis:decrby(itsspider.."spider:Num:Add:Games"..msg.chat_id..msg.sender.user_id,NumGame)  
Redis:incrby(itsspider.."spider:Num:Message:User"..msg.chat_id..":"..msg.sender.user_id,NumGame)  
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم خصم *↫ ❨ "..NumGame.." ❩* من مجوهراتك \n⌁ : وتم اضافة* ↫ ❨ "..(NumGame * 50).." ❩ رساله الى رسالك *","md",true)  end 
if text and text:match("^اضف مجوهرات (%d+)$") and msg.reply_to_message_id ~= 0 then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
Redis:incrby(itsspider.."spider:Num:Add:Games"..msg.chat_id..Message_Reply.sender.user_id, text:match("^اضف مجوهرات (%d+)$"))  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم اضافه له ❨ "..text:match("^اضف مجوهرات (%d+)$").." ❩ من المجوهرات").Reply,"md",true)  end
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id ~= 0 then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للادمنية واعلى فقط',"md",true)  end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
Redis:incrby(itsspider.."spider:Num:Message:User"..msg.chat_id..":"..Message_Reply.sender.user_id, text:match("^اضف رسائل (%d+)$"))  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"⌁ : تم اضافه له {"..text:match("^اضف رسائل (%d+)$").."} من الرسائل").Reply,"md",true)  end
if text == "مجوهراتي" or text == "نقاطي" then 
local Num = Redis:get(itsspider.."spider:Num:Add:Games"..msg.chat_id..msg.sender.user_id) or 0
if Num == 0 then 
return LuaTele.sendText(msg_chat_id,msg_id, "⌁ : لم تفز بأي مجوهره ","md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id, "⌁ : عدد الجواهر التي ربحتها *↫ "..Num.." *","md",true) end end
if text == 'ترتيب الاوامر' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'تعط','تعطيل الايدي بالصوره')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'تفع','تفعيل الايدي بالصوره')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'ا','ايدي')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'م','رفع مميز')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'اد', 'رفع ادمن')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'مد','رفع مدير')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'من', 'رفع منشئ')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'اس', 'رفع منشئ اساسي')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'مط','رفع مطور')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'تك','تنزيل الكل')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'ر','الرابط')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'رر','ردود المدير')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'،،','مسح المكتومين')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'رد','اضف رد')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'سح','مسح سحكاتي')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'غ','غنيلي')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'رس','مسح رسائلي')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'ثانوي','رفع مطور ثانوي')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'رد','اضف رد')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'حذ','حذف رد')
Redis:set(itsspider.."spider:Get:Reides:Commands:Group"..msg_chat_id..":"..'#','مسح قائمه العام')

return LuaTele.sendText(msg_chat_id,msg_id,[[*
⌁ : تم ترتيب الاوامر بالشكل التالي ↫ ⤈
⌁ : ايدي - ا .
⌁ : الرابط - ر .
⌁ : غنيلي - غ .
⌁ : رفع مميز - م .
⌁ : اضف رد - رد .
⌁ : رفع ادمن - اد .
⌁ : حذف رد - حذ .
⌁ : رفع مدير - مد .
⌁ : رفع منشى - من .
⌁ : تنزيل الكل - تك .
⌁ : ردود المدير - رر .
⌁ : رفع مطور - مط .
⌁ : مسح رسائلي - رس .
⌁ : مسح المكتومين - ،، .
⌁ : مسح قائمة العام - # .
⌁ : مسح سحكاتي - سح .
⌁ : رفع مطور ثانوي - ثانوي .
⌁ : رفع منشئ الاساسي - اس .
⌁ : تفعيل الايدي بالصوره - تفع .
⌁ : تعطيل الايدي بالصوره - تعط .
*]],"md") end
end -- GroupBot
if chat_type(msg.chat_id) == "UserBot" then 
if text == '‹ تحديث السورس ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
os.execute('rm -rf spider.lua')
download('https://raw.githubusercontent.com/spiderxr/spider/main/spider.lua','spider.lua')
print("\27[31;47m\n          ( تم تحديث السورس )          \n\27[0;34;49m\n") 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*⌁ : تم تحديث السورس* ',"md",true)  end
if text == '‹ تحديث الملفات ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
print("\27[31;47m\n        ( تم تحديث ملفات البوت )        \n\27[0;34;49m\n") 
LuaTele.sendText(msg_chat_id,msg_id, "*⌁ : تم تحديث الملفات*","md",true)
dofile('spider.lua')  end
if text == '/start' or text == '‹ رجوع ›' then
Redis:sadd(itsspider..'spider:Num:User:Pv',msg.sender.user_id)  
if not msg.DevelopersAS then
if not Redis:get(itsspider.."spider:Start:Bot") then
local CmdStart = '⌁ : مرحبا انا بوت اسمي ‹ '..(Redis:get(itsspider.."spider:Name:Bot") or "لار")..' ›\n⌁ : اختصاصي التسليه وحماية المجموعات\n⌁ : من المخربين والتفليش والسبام والخ\n⌁ : فقط قم برفعي ادمن في مجموعتك\n⌁ : وارسل كلمة ↫ ‹ تفعيل ›'
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ المطور ›', url = "t.me/"..UserSudo..""},},{{text = '‹ قناة السورس ›', url = 't.me/wwttw'},{text = '‹ لتنصيب بوت ›', url = 't.me/NNUUU'},},{{text = '‹ اضفني الى مجموعتك ›', url = 't.me/'..UserBot..'?startgroup=new'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,CmdStart,"md",false, false, false, false, reply_markup)
else
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ المطور ›', url = "t.me/"..UserSudo..""},},{{text = '‹ قناة السورس ›', url = 't.me/wwttw'},{text = '‹ لتنصيب بوت ›', url = 't.me/NNUUU'},},{{text = '‹ اضفني الى مجموعتك ›', url = 't.me/'..UserBot..'?startgroup=new'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,Redis:get(itsspider.."spider:Start:Bot"),"md",false, false, false, false, reply_markup) end
else
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{{text = '‹  السورس  ›',type = 'text'},{text = '‹  اسم البوت  ›', type = 'text'},},{{text = '‹  المطورين  ›',type = 'text'},{text = '‹  الاحصائيات  ›',type = 'text'},},{{text = '‹  الاذاعة  ›',type = 'text'},{text = '‹  العام  ›', type = 'text'},},{{text = '‹  الاشتراك الاجباري  ›',type = 'text'},{text = '‹  التفعيل والتعطيل  ›',type = 'text'},},{{text = '‹  ردود الخاص  ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : اهلاً بك عزيزي ‹ المطور ›\n⌁ : اليك الازرار الخاصة بسورس فروكس', 'md', false, false, false, false, reply_markup) end end
if text == '‹  ردود الخاص  ›' and msg.DevelopersAS then
Redis:sadd(itsspider..'spider:Num:User:Pv',msg.sender.user_id)  
local OR33 = '⌁ : اهلا بك في قسم ‹ ردود الخاص ›\n⌁ : اضغط على الامر الذي تريد تنفيذه'
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{{text = '‹ جلب رد الخاص ›',type = 'text'},},{{text = '‹ حذف رد الخاص ›',type = 'text'},{text = '‹ تغيير رد الخاص ›',type = 'text'},},{{text = '‹ رجوع ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, OR33, 'md', false, false, false, false, reply_markup) end
if text == '‹  السورس  ›' and msg.DevelopersAS then
Redis:sadd(itsspider..'spider:Num:User:Pv',msg.sender.user_id)  
local OR33 = '⌁ : اهلا بك في قسم ‹ السورس ›\n⌁ : اضغط على الامر الذي تريد تنفيذه'
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{{text = '‹ تحديث الملفات ›',type = 'text'},{text = '‹ تحديث السورس ›', type = 'text'},},{{text = '‹ مبرمج السورس ›', type = 'text'},},{{text = '‹ تحديثات السورس ›',type = 'text'},{text = '‹ قناة السورس ›',type = 'text'},},{{text = '‹ رجوع ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, OR33, 'md', false, false, false, false, reply_markup) end
if text == '‹  اسم البوت  ›' and msg.DevelopersAS then
Redis:sadd(itsspider..'spider:Num:User:Pv',msg.sender.user_id)  
local OR33 = '⌁ : اهلا بك في قسم ‹ اسم البوت ›\n⌁ : اضغط على الامر الذي تريد تنفيذه'
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{
{text = '‹ اسم البوت ›', type = 'text'},},{{text = '‹ حذف الاسم ›',type = 'text'},{text = '‹ تغيير الاسم ›',type = 'text'},},{{text = '‹ رجوع ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, OR33, 'md', false, false, false, false, reply_markup) end
if text == '‹  الاذاعة  ›' and msg.DevelopersAS then
Redis:sadd(itsspider..'spider:Num:User:Pv',msg.sender.user_id)  
local OR33 = '⌁ : اهلا بك في قسم ‹ الاذاعة ›\n⌁ : اضغط على الامر الذي تريد تنفيذه'
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{{text = '‹ اذاعة للمجموعات ›',type = 'text'},{text = '‹ اذاعة للخاص ›', type = 'text'},},{{text = '‹ اذاعة بالتثبيت ›', type = 'text'},},{{text = '‹ اذاعة توجيه للمجموعات ›',type = 'text'},{text = '‹ اذاعة توجيه للخاص ›',type = 'text'},},{{text = '‹ الغاء الامر ›',type = 'text'},},{{text = '‹ رجوع ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, OR33, 'md', false, false, false, false, reply_markup) end
if text == '‹  العام  ›' and msg.DevelopersAS then
Redis:sadd(itsspider..'spider:Num:User:Pv',msg.sender.user_id)  
local OR33 = '⌁ : اهلا بك في قسم ‹ العام ›\n⌁ : اضغط على الامر الذي تريد تنفيذه'
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{{text = '‹ حذف رد عام ›',type = 'text'},{text = '‹ اضف رد عام ›', type = 'text'},},{{text = '‹ حذف ردود العام ›',type = 'text'},{text = '‹ ردود العام ›',type = 'text'},},{{text = '‹ حذف المكتومين عام ›',type = 'text'},{text = '‹ المكتومين عام ›',type = 'text'},},{{text = '‹ حذف المحظورين عام ›',type = 'text'},{text = '‹ المحظورين عام ›',type = 'text'},},{{text = '‹ رجوع ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, OR33, 'md', false, false, false, false, reply_markup) end
if text == '‹  المطورين  ›' and msg.DevelopersAS then
Redis:sadd(itsspider..'spider:Num:User:Pv',msg.sender.user_id)  
local OR33 = '⌁ : اهلا بك في قسم ‹ المطورين ›\n⌁ : اضغط على الامر الذي تريد تنفيذه'
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{{text = '‹ حذف الاساسيين ›',type = 'text'},{text = '‹ الاساسيين ›', type = 'text'},},{{text = '‹ حذف الثانويين ›',type = 'text'},{text = '‹ الثانويين ›', type = 'text'},},{{text = '‹ حذف المطورين ›',type = 'text'},{text = '‹ المطورين ›',type = 'text'},},{{text = '‹ تغيير المطور الاساسي ›',type = 'text'},},{{text = '‹ رجوع ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, OR33, 'md', false, false, false, false, reply_markup) end
if text == '‹  الاحصائيات  ›' and msg.DevelopersAS then
Redis:sadd(itsspider..'spider:Num:User:Pv',msg.sender.user_id)  
local OR33 = '⌁ : اهلا بك في قسم ‹ الاحصائيات ›\n⌁ : اضغط على الامر الذي تريد تنفيذه'
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{{text = '‹ الاحصائيات ›',type = 'text'},},{{text = '‹ تنظيف المجموعات ›',type = 'text'},{text = '‹ تنظيف المشتركين ›',type = 'text'},},{{text = '‹ جلب النسخة الاحتياطية ›',type = 'text'},},{{text = '‹ جلب نسخة الردود ›',type = 'text'},},{{text = '‹ رجوع ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, OR33, 'md', false, false, false, false, reply_markup) end
if text == '‹  الاشتراك الاجباري  ›' and msg.DevelopersAS then
Redis:sadd(itsspider..'spider:Num:User:Pv',msg.sender.user_id)  
local OR33 = '⌁ : اهلا بك في قسم ‹ الاشتراك الاجباري ›\n⌁ : اضغط على الامر الذي تريد تنفيذه'
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{{text = '‹ حذف كليشة الاشتراك ›',type = 'text'},{text = '‹ تغير كليشة الاشتراك ›',type = 'text'},},{{text = '‹ الاشتراك الاجباري ›',type = 'text'},},{{text = '‹ تعطيل الاشتراك الاجباري ›',type = 'text'},{text = '‹ تفعيل الاشتراك الاجباري ›',type = 'text'},},{{text = '‹ تغيير الاشتراك الاجباري ›',type = 'text'},},{{text = '‹ حذف اسم القناة ›',type = 'text'},{text = '‹ تغير اسم القناة ›',type = 'text'},},{{text = '‹ الغاء الامر ›',type = 'text'},},{{text = '‹ رجوع ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, OR33, 'md', false, false, false, false, reply_markup) end
if text == '‹  التفعيل والتعطيل  ›' and msg.DevelopersAS then
Redis:sadd(itsspider..'spider:Num:User:Pv',msg.sender.user_id)  
local OR33 = '⌁ : اهلا بك في قسم ‹ التفعيل والتعطيل ›\n⌁ : اضغط على الامر الذي تريد تنفيذه'
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{{text = '‹ تعطيل التواصل ›',type = 'text'},{text = '‹ تفعيل التواصل ›', type = 'text'},},{{text = '‹ تعطيل الاذاعة ›',type = 'text'},{text = '‹ تفعيل الاذاعة ›',type = 'text'},},{{text = '‹ تعطيل المغادرة ›',type = 'text'},{text = '‹ تفعيل المغادرة ›',type = 'text'},},{{text = '‹ تعطيل البوت الخدمي ›',type = 'text'},{text = '‹ تفعيل البوت الخدمي ›',type = 'text'},},{{text = '‹ رجوع ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, OR33, 'md', false, false, false, false, reply_markup) end
-- OR33 --
if text == '‹ تنظيف المشتركين ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(itsspider.."spider:Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
local ChatAction = LuaTele.sendChatAction(v,'Typing')
if ChatAction.luatele ~= "ok" then
x = x + 1
Redis:srem(itsspider..'spider:Num:User:Pv',v) end end
if x ~= 0 then return LuaTele.sendText(msg_chat_id,msg_id,'*⌁ : العدد الكلي ‹ '..#list..' ›\n⌁ : تم العثور على ‹ '..x..' › من المشتركين حاظرين البوت*',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*⌁ : العدد الكلي ‹ '..#list..' ›\n⌁ : لم يتم العثور على وهميين*',"md") end end
if text == '‹ تنظيف المجموعات ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(itsspider.."spider:ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
if Get_Chat.id then
local statusMem = LuaTele.getChatMember(Get_Chat.id,spider)
if statusMem.status.luatele == "chatMemberStatusMember" then
x = x + 1
LuaTele.sendText(Get_Chat.id,0,'*⌁ : البوت عضو في المجموعة سوف اغادر ويمكنك تفعيلي مره اخره *',"md")
Redis:srem(itsspider..'spider:ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(itsspider..'*'..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i]) end
LuaTele.leaveChat(Get_Chat.id) end
else
x = x + 1
local keys = Redis:keys(itsspider..'*'..v)
for i = 1, #keys do
Redis:del(keys[i]) end
Redis:srem(itsspider..'spider:ChekBotAdd',v)
LuaTele.leaveChat(v) end end
if x ~= 0 then return LuaTele.sendText(msg_chat_id,msg_id,'*⌁ : العدد الكلي ‹ '..#list..' › للمجموعات \n⌁ : تم العثور على ‹ '..x..' › مجموعات البوت ليس ادمن \n⌁ : تم تعطيل المجموعة ومغادره البوت من الوهمي *',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*⌁ : العدد الكلي ‹ '..#list..' › للمجموعات \n⌁ : لا توجد مجموعات وهميه*',"md") end end
if text == '‹ جلب رد الخاص ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:get(itsspider.."spider:Start:Bot") then
local CmdStart = '⌁ : مرحبا انا بوت اسمي ‹ '..(Redis:get(itsspider.."spider:Name:Bot") or "لار")..' ›\n⌁ : اختصاصي التسليه وحماية المجموعات \n⌁ : من المخربين والتفليش والسبام والخ\n⌁ : فقط قم برفعي ادمن في مجموعتك\n⌁ : وارسل كلمة ↫ ‹ تفعيل ›'
return LuaTele.sendText(msg_chat_id,msg_id,CmdStart,"md",false, false, false, false, reply_markup)
else
return LuaTele.sendText(msg_chat_id,msg_id,Redis:get(itsspider.."spider:Start:Bot"),"md",false, false, false, false, reply_markup) end end
if text == '‹ تغيير رد الخاص ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(itsspider.."spider:Change:Start:Bot"..msg.sender.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل لي كليشة Start الان ","md",true)  end
if text == '‹ حذف رد الخاص ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Start:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حذف كليشة Start ","md",true)   
end
if text == '‹ تغيير الاسم ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(itsspider.."spider:Change:Name:Bot"..msg.sender.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل لي الاسم الان ","md",true)  end
if text == '‹ حذف الاسم ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:Name:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حذف اسم البوت ","md",true)   
end
if text and text:match("^تعين عدد الاعضاء (%d+)$") and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider..'spider:Num:Add:Bot',text:match("تعين عدد الاعضاء (%d+)$") ) 
LuaTele.sendText(msg_chat_id,msg_id,'*⌁ : تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعين عدد الاعضاء (%d+)$")..' عضو *',"md",true)  
elseif text =='‹ الاحصائيات ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
LuaTele.sendText(msg_chat_id,msg_id,'*⌁ : احصائيات البوت ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n⌁ : عدد المجموعات ↫ '..(Redis:scard(itsspider..'spider:ChekBotAdd') or 0)..'\n⌁ : عدد المشتركين ↫ '..(Redis:scard(itsspider..'spider:Num:User:Pv') or 0)..'*',"md",true)  end
if text == '‹ تغيير كليشة المطور ›' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/DelDev'},},}}
Redis:set(itsspider..'spider:GetTexting:Devspider'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل لي كليشة المطور الان\n⌁ : ايضاً يمكنك استخدام ما يلي ↫ ⤈\n⌁ : دالة عرض الاسم ↫ ‹ `DevName` ›\n⌁ : دالة عرض الايدي ↫ ‹ `DeviD` ›\n⌁ : دالة عرض المعرف ↫ ‹ `DevUser` ›\n⌁ : دالة عرض البايو ↫ ‹ `DevBio` ›\n⌁ : دالة عرض اسم المجموعة ↫ ‹ `NameGr` ›","md",false, false, false, false, reply_markup) end
if text == '‹ حذف كليشة المطور ›' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider..'spider:Texting:Devspider')
return LuaTele.sendText(msg_chat_id,msg_id,'⌁ : تم حذف كليشة المطور') end
if text == '‹ اضف رد عام ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:Set:Rd"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل الان الكلمه لاضافتها في ردود المطور ","md",true)  end
if text == '‹ حذف رد عام ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/OR33closeSo'},},}}
Redis:set(itsspider.."spider:Set:On"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل الان الكلمه لحذفها من ردود المطور","md",false, false, false, false, reply_markup) 
end
if text=='‹ اذاعة للخاص ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(itsspider.."spider:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
⌁ : ارسل لي سواء كان :
‹ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه • صوت • رساله ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : للخروج ارسل ↫ ‹ الغاء ›
 ✓
]],"md",true)  
return false end
if text=='‹ اذاعة للمجموعات ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(itsspider.."spider:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
⌁ : ارسل لي سواء كان :
‹ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه • صوت • رساله ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : للخروج ارسل ↫ ‹ الغاء ›
✓
]],"md",true)  
return false end
if text=="‹ اذاعة بالتثبيت ›" and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(itsspider.."spider:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
⌁ : ارسل لي سواء كان :
‹ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه • صوت • رساله ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : للخروج ارسل ↫ ‹ الغاء ›
✓
]],"md",true)  
return false end
if text=="‹ اذاعة توجيه للمجموعات ›" and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(itsspider.."spider:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل لي التوجيه الان\n⌁ : ليتم نشره في المجموعات","md",true)  
return false end
if text=='‹ اذاعة توجيه للخاص ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(itsspider.."spider:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"⌁ : ارسل لي التوجيه الان\n⌁ : ليتم نشره الى المشتركين","md",true)  
return false end
if text == ("‹ ردود العام ›") and msg.DevelopersAS then 

if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(itsspider.."spider:List:Rd:Sudo")
text = "\n⌁ : قائمة ردود المطور ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(itsspider.."spider:Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(itsspider.."spider:Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(itsspider.."spider:Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🃏"
elseif Redis:get(itsspider.."spider:Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif Redis:get(itsspider.."spider:Add:Rd:Sudo:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(itsspider.."spider:Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(itsspider.."spider:Add:Rd:Sudo:File"..v) then
db = "ملف 📁"
elseif Redis:get(itsspider.."spider:Add:Rd:Sudo:Audio"..v) then
db = "اغنيه ??"
elseif Redis:get(itsspider.."spider:Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." - ‹ "..v.." › ↫ ‹"..db.."›\n"
end
if #list == 0 then
text = "⌁ : عذراً لا توجد ردود للمطور"
end
return LuaTele.sendText(msg_chat_id,msg_id,"["..text.."]","md",true)  end
if text == ("‹ حذف ردود العام ›") and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(itsspider.."spider:List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(itsspider.."spider:Add:Rd:Sudo:Gif"..v)   
Redis:del(itsspider.."spider:Add:Rd:Sudo:vico"..v)   
Redis:del(itsspider.."spider:Add:Rd:Sudo:stekr"..v)     
Redis:del(itsspider.."spider:Add:Rd:Sudo:Text"..v)   
Redis:del(itsspider.."spider:Add:Rd:Sudo:Photo"..v)
Redis:del(itsspider.."spider:Add:Rd:Sudo:Video"..v)
Redis:del(itsspider.."spider:Add:Rd:Sudo:File"..v)
Redis:del(itsspider.."spider:Add:Rd:Sudo:Audio"..v)
Redis:del(itsspider.."spider:Add:Rd:Sudo:video_note"..v)
Redis:del(itsspider.."spider:List:Rd:Sudo") end
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم حذف ردود المطور","md",true)  end
if text == '‹ حذف المطورين ›' and msg.DevelopersAS then

if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:Developers:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مطورين حالياً , ","md",true)  end
Redis:del(itsspider.."spider:Developers:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من المطورين *","md",true) end
if text == '‹ حذف الاساسيين ›' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:DevelopersAS:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مطورين اساسيين حالياً , ","md",true)  end
Redis:del(itsspider.."spider:DevelopersAS:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من المطورين *","md",true) end
if text == '‹ حذف الثانويين ›' and msg.DevelopersAS then

if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:DevelopersQ:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مطورين ثانويين حالياً , ","md",true)  end
Redis:del(itsspider.."spider:DevelopersQ:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من المطورين *","md",true) end
if text == '‹ حذف المحظورين عام ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:BanAll:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد محظورين عام حالياً , ","md",true)  end
Redis:del(itsspider.."spider:BanAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من المحظورين عام *","md",true) end
if text == '‹ حذف المكتومين عام ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:ktmAll:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مكتومين عام حالياً , ","md",true)  end
Redis:del(itsspider.."spider:ktmAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌁ : تم مسح ‹ "..#Info_Members.." › من المكتومين عام *","md",true) end
if text == '‹ تعطيل البوت الخدمي ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:BotFree") 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل البوت الخدمي ","md",true) end
if text == '‹ تعطيل التواصل ›' and msg.DevelopersAS then

if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(itsspider.."spider:TwaslBot") 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تعطيل التواصل داخل البوت ","md",true) end
if text == '‹ تفعيل البوت الخدمي ›' and msg.DevelopersAS then

if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:BotFree",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تفعيل البوت الخدمي ","md",true) end
if text == '‹ تفعيل التواصل ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(itsspider.."spider:TwaslBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : تم تفعيل التواصل داخل البوت ","md",true) end
if text == '‹ المحظورين عام ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:BanAll:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد محظورين عام حالياً , ","md",true)  end
ListMembers = '\n*⌁ : قائمة المحظورين عام ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
var(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المحظورين عام ›', data = msg.sender.user_id..'/BanAll'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == '‹ المكتومين عام ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:ktmAll:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مكتومين عام حالياً , ","md",true)  end
ListMembers = '\n*⌁ : قائمة المكتومين عام ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المكتومين عام ›', data = msg.sender.user_id..'/ktmAll'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == '‹ المطورين ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:Developers:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مطورين حالياً , ","md",true)  end
ListMembers = '\n*⌁ : قائمة مطورين البوت ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المطورين ›', data = msg.sender.user_id..'/Developers'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == '‹ الاساسيين ›' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:DevelopersAS:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مطورين اساسيين حالياً , ","md",true)  end
ListMembers = '\n*⌁ : قائمة المطورين الاساسيين ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح الاساسيين ›', data = msg.sender.user_id..'/DevelopersAS'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == '‹ الثانويين ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(itsspider.."spider:DevelopersQ:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"⌁ : لا يوجد مطورين ثانويين حالياً , ","md",true)  end
ListMembers = '\n*⌁ : قائمة المطورين الثانويين ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح الثانويين ›', data = msg.sender.user_id..'/DevelopersQ'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text and text:match('^حظر عام @(%S+)$') then
local UserName = text:match('^حظر عام @(%S+)$')
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if Controllerbanall(msg_chat_id,UserId_Info.id) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع حظر ↫ ‹ "..Controller(msg_chat_id,UserId_Info.id).." › ","md",true)  end
if Redis:sismember(itsspider.."spider:BanAll:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم حظره عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:BanAll:Groups",UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم حظره عام من المجموعات ").Reply,"md",true) end end
if text and text:match('^الغاء حظر عام (%d+)$') then
local UserId = text:match('^الغاء حظر عام (%d+)$')
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(itsspider..'spider:ChanneliD:Join'))
local NcH = (Redis:get(itsspider.."spider:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(itsspider.."spider:CHlink:Bot") or "⌁ : عذراً لاتستطيع استخدام البوت !\n⌁ : عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsspider..'spider:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if not Redis:sismember(itsspider.."spider:BanAll:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم الغاء حظره عام من المجموعات بالتأكيد").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:BanAll:Groups",UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"⌁ : تم الغاء حظره عام من المجموعات").Reply,"md",true) end end
if text and text:match('^الغاء حظر عام @(%S+)$') then
local UserName = text:match('^الغاء حظر عام @(%S+)$')
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if not Redis:sismember(itsspider.."spider:BanAll:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم الغاء حظره عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:BanAll:Groups",UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم الغاء حظره عام من المجموعات ").Reply,"md",true) end end
if text and text:match('^كتم عام @(%S+)$') then
local UserName = text:match('^كتم عام @(%S+)$')
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام معرف البوت ","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'المطور الاساسي' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'المطور الاساسي' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'المطور الاساسي²' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'المطور' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'مبرمج السورس' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌁ : عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Redis:sismember(itsspider.."spider:ktmAll:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم كتمه عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(itsspider.."spider:ktmAll:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم كتمه عام من المجموعات ").Reply,"md",true) end end
if text and text:match('^الغاء كتم عام @(%S+)$') then
local UserName = text:match('^الغاء كتم عام @(%S+)$')
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌁ : هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n⌁ : عذرا لا تستطيع استخدام معرف البوت ","md",true)  end
if not Redis:sismember(itsspider.."spider:ktmAll:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم الغاء كتمه عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:srem(itsspider.."spider:ktmAll:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⌁ : تم الغاء كتمه عام من المجموعات  ").Reply,"md",true) end end
if not msg.DevelopersAS then
if Redis:get(itsspider.."spider:TwaslBot") and not Redis:sismember(itsspider.."spider:BaN:In:Tuasl",msg.sender.user_id) then
local ListGet = {Sudo_Id,msg.sender.user_id}
local IdSudo = LuaTele.getChat(ListGet[1]).id
local IdUser = LuaTele.getChat(ListGet[2]).id
local FedMsg = LuaTele.sendForwarded(IdSudo, 0, IdUser, msg_id)
Redis:setex(itsspider.."spider:Twasl:UserId"..msg.date,172800,IdUser)
if FedMsg.content.luatele == "messageSticker" then
LuaTele.sendText(IdSudo,0,Reply_Status(IdUser,'⌁ : قام بارسال الملصق').Reply,"md",true)  end
return LuaTele.sendText(IdUser,msg_id,'⌁ : تم ارسال رسالتك الى المطور',"md",true)  end
else 
if msg.reply_to_message_id ~= 0 then
local Message_Get = LuaTele.getMessage(msg_chat_id, msg.reply_to_message_id)
if Message_Get.forward_info then
local Info_User = Redis:get(itsspider.."spider:Twasl:UserId"..Message_Get.forward_info.date) or 46899864
if text == 'حظر' then
Redis:sadd(itsspider..'spider:BaN:In:Tuasl',Info_User)  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'⌁ : تم حظره من تواصل البوت ').Reply,"md",true)  end 
if text =='الغاء الحظر' or text =='الغاء حظر' then
Redis:srem(itsspider..'spider:BaN:In:Tuasl',Info_User)  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'⌁ : تم الغاء حظره من تواصل البوت ').Reply,"md",true)  end 
local ChatAction = LuaTele.sendChatAction(Info_User,'Typing')
if not Info_User or ChatAction.message == "USER_IS_BLOCKED" then
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'⌁ : قام بحظر البوت لا استطيع ارسال رسالتك ').Reply,"md",true)  end
if msg.content.video_note then
LuaTele.sendVideoNote(Info_User, 0, msg.content.video_note.video.remote.id)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
LuaTele.sendPhoto(Info_User, 0, idPhoto,'')
elseif msg.content.sticker then 
LuaTele.sendSticker(Info_User, 0, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then 
LuaTele.sendVoiceNote(Info_User, 0, msg.content.voice_note.voice.remote.id, '', 'md')
elseif msg.content.video then 
LuaTele.sendVideo(Info_User, 0, msg.content.video.video.remote.id, '', "md")
elseif msg.content.animation then 
LuaTele.sendAnimation(Info_User,0, msg.content.animation.animation.remote.id, '', 'md')
elseif msg.content.document then
LuaTele.sendDocument(Info_User, 0, msg.content.document.document.remote.id, '', 'md')
elseif msg.content.audio then
LuaTele.sendAudio(Info_User, 0, msg.content.audio.audio.remote.id, '', "md") 
elseif text then
LuaTele.sendText(Info_User,0,text,"md",true) end 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'⌁ : تم ارسال رسالتك اليه ').Reply,"md",true) end end end 
end --UserBot
end -- File_Bot_Run


function CallBackLua(data) --- هذا الكالباك بي الابديت
--var(data) 
if data and data.luatele and data.luatele == "updateNewInlineCallbackQuery" then
local Text = LuaTele.base64_decode(data.payload.data)
if Text and Text:match('/Hmsa1@(%d+)@(%d+)/(%d+)') then
local ramsesadd = {string.match(Text,"^/Hmsa1@(%d+)@(%d+)/(%d+)$")}
if tonumber(data.sender_user_id) == tonumber(ramsesadd[1]) or tonumber(ramsesadd[2]) == tonumber(data.sender_user_id) then
local inget = Redis:get(itsspider..'hmsabots'..ramsesadd[3]..data.sender_user_id)
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape(inget)..'&show_alert=true')
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('⌁ : الھمسة ليست لك .')..'&show_alert=true') end end
end
if data and data.luatele and data.luatele == "updateNewInlineQuery" then
local Text = data.query
if Text and Text:match("^(.*) @(.*)$")  then
local username = {string.match(Text,"^(.*) @(.*)$")}
local UserId_Info = LuaTele.searchPublicChat(username[2])
if UserId_Info.id then
local idnum = math.random(1,64)
local input_message_content = {message_text = '‹ همسة سرية الى ( [@'..username[2]..'] ) هو فقط من يستيطع رؤيتها .', parse_mode = 'Markdown'} 
local reply_markup = {inline_keyboard={{{text = '‹ عرض الھمسة ›', callback_data = '/Hmsa1@'..data.sender_user_id..'@'..UserId_Info.id..'/'..idnum}}}} 
local resuult = {{type = 'article', id = idnum, title = 'هذه الھمسة سرية الى ( @'..username[2]..' )', input_message_content = input_message_content, reply_markup = reply_markup}} 
https.request("https://api.telegram.org/bot"..Token..'/answerInlineQuery?inline_query_id='..data.id..'&results='..JSON.encode(resuult))
Redis:set(itsspider..'hmsabots'..idnum..UserId_Info.id,username[1])
Redis:set(itsspider..'hmsabots'..idnum..data.sender_user_id,username[1]) end end
end
if data and data.luatele and data.luatele == "updateSupergroup" then
local Get_Chat = LuaTele.getChat('-100'..data.supergroup.id)
if data.supergroup.status.luatele == "chatMemberStatusBanned" then
Redis:srem(itsspider.."spider:ChekBotAdd",'-100'..data.supergroup.id)
local keys = Redis:keys(itsspider..'*'..'-100'..data.supergroup.id)
for i = 1, #keys do
Redis:del(keys[i]) end
return LuaTele.sendText(Sudo_Id,0,'\n⌁ : تم طرد البوت من مجموعة ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n⌁ : اسم المجموعة ↫ '..Get_Chat.title..'\n⌁ : ايدي المجموعة ↫ ⤈\n❨ `-100'..data.supergroup.id..'` ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n⌁ : الوقت ↫ '..os.date('%I:%M%p')..'\n⌁ : التاريخ ↫ '..os.date('%Y/%m/%d')..'',"md") end
elseif data and data.luatele and data.luatele == "updateMessageSendSucceeded" then
local msg = data.message
local Chat = msg.chat_id
if msg.content.text then
text = msg.content.text.text
end
if msg.content.video_note then
if msg.content.video_note.video.remote.id == Redis:get(itsspider.."spider:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(itsspider.."spider:PinMsegees:"..msg.chat_id) end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
if idPhoto == Redis:get(itsspider.."spider:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(itsspider.."spider:PinMsegees:"..msg.chat_id) end
elseif msg.content.sticker then 
if msg.content.sticker.sticker.remote.id == Redis:get(itsspider.."spider:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(itsspider.."spider:PinMsegees:"..msg.chat_id) end
elseif msg.content.voice_note then 
if msg.content.voice_note.voice.remote.id == Redis:get(itsspider.."spider:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(itsspider.."spider:PinMsegees:"..msg.chat_id) end
elseif msg.content.video then 
if msg.content.video.video.remote.id == Redis:get(itsspider.."spider:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(itsspider.."spider:PinMsegees:"..msg.chat_id) end
elseif msg.content.animation then 
if msg.content.animation.animation.remote.id ==  Redis:get(itsspider.."spider:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(itsspider.."spider:PinMsegees:"..msg.chat_id) end
elseif msg.content.document then
if msg.content.document.document.remote.id == Redis:get(itsspider.."spider:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(itsspider.."spider:PinMsegees:"..msg.chat_id) end
elseif msg.content.audio then
if msg.content.audio.audio.remote.id == Redis:get(itsspider.."spider:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(itsspider.."spider:PinMsegees:"..msg.chat_id) end
elseif text then
if text == Redis:get(itsspider.."spider:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(itsspider.."spider:PinMsegees:"..msg.chat_id) end end

elseif data and data.luatele and data.luatele == "updateNewMessage" then
if data.message.content.luatele == "messageChatDeleteMember" or data.message.content.luatele == "messageChatAddMembers" or data.message.content.luatele == "messagePinMessage" or data.message.content.luatele == "messageChatChangeTitle" or data.message.content.luatele == "messageChatJoinByLink" then
if Redis:get(itsspider.."spider:Lock:tagservr"..data.message.chat_id) then
LuaTele.deleteMessages(data.message.chat_id,{[1]= data.message.id}) end end 
File_Bot_Run(data.message,data.message)

elseif data and data.luatele and data.luatele == "updateMessageEdited" then
-- data.chat_id -- data.message_id
local Message_Edit = LuaTele.getMessage(data.chat_id, data.message_id)
if Message_Edit.sender.user_id == spider then
print('This is Edit for Bot')
return false end
File_Bot_Run(Message_Edit,Message_Edit)
Redis:incr(itsspider..'spider:Num:Message:Edit'..data.chat_id..Message_Edit.sender.user_id)
if Message_Edit.content.luatele == "messageContact" or Message_Edit.content.luatele == "messageVideoNote" or Message_Edit.content.luatele == "messageDocument" or Message_Edit.content.luatele == "messageAudio" or Message_Edit.content.luatele == "messageVideo" or Message_Edit.content.luatele == "messageVoiceNote" or Message_Edit.content.luatele == "messageAnimation" or Message_Edit.content.luatele == "messagePhoto" then
if Redis:get(itsspider.."spider:Lock:edit"..data.chat_id) then
LuaTele.deleteMessages(data.chat_id,{[1]= data.message_id}) end end
elseif data and data.luatele and data.luatele == "updateNewCallbackQuery" then
-- data.chat_id
-- data.payload.data
-- data.sender_user_id
Text = LuaTele.base64_decode(data.payload.data)
IdUser = data.sender_user_id
ChatId = data.chat_id
Msg_id = data.message_id

--
if Text and Text:match('(%d+)/UpdateSo') then
local UserId = Text:match('(%d+)/UpdateSo')
if tonumber(IdUser) == tonumber(UserId) then 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'UpdateBack'},},}}
os.execute('rm -rf spider.lua')
download('https://raw.githubusercontent.com/spiderxr/spider/main/spider.lua','spider.lua')
print("\27[31;47m\n          ( تم تحديث السورس )          \n\27[0;34;49m\n") 
return LuaTele.editMessageText(ChatId,Msg_id, '*⌁ : تم تحديث السورس*', 'md',true, false, reply_markup) end end
--
if Text and Text:match('(%d+)/UpdateFi') then
local UserId = Text:match('(%d+)/UpdateFi')
if tonumber(IdUser) == tonumber(UserId) then 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'UpdateBack'},},}}
print("\27[31;47m\n        ( تم تحديث الملفات )        \n\27[0;34;49m\n") 
LuaTele.editMessageText(ChatId,Msg_id, '*⌁ : تم تحديث ملفات البوت*', 'md',true, false, reply_markup)
dofile('spider.lua')  end end
--
if Text and Text:match('(%d+)/UpdateBack') then
local UserId = Text:match('(%d+)/UpdateBack')
if tonumber(IdUser) == tonumber(UserId) then 
local reply_markup = LuaTele.replyMarkup{
type = 'inline',data = {{{text = '‹ تحديث الملفات ›', data = UserId..'/'.. 'UpdateFi'},{text = '‹ تحديث السورس ›', data = UserId..'/'.. 'UpdateSo'},},{{text='‹ اخفاء الاوامر ›',data=UserId..'/'.. 'delAmr'}},}}
return LuaTele.editMessageText(ChatId,Msg_id, '⌁ : اليك ازرار التحديث الخاصة بالسورس ↫ ⤈', 'md',true, false, reply_markup) end end
--
if Text and Text:match('(%d+)/BanAllktm') then
local UserId = Text:match('(%d+)/BanAllktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:BanAll:Groups") 
Redis:del(itsspider.."spider:ktmAll:Groups") 
return LuaTele.editMessageText(ChatId,Msg_id,"⌁ : تم مسح قائمة العام", 'md', true) end end
--
if Text and Text:match('(%d+)/MsHOR33') then
local UserId = Text:match('(%d+)/MsHOR33')
if tonumber(IdUser) == tonumber(UserId) then
local list = Redis:smembers(itsspider.."spider:allM"..data.chat_id)
for k,v in pairs(list) do
local Message = v
if Message then
t = "⌁ : تم حذف ‹ "..k.." › من الميديا"
LuaTele.deleteMessages(data.chat_id,{[1]= Message})
Redis:del(itsspider.."spider:allM"..data.chat_id) end end
if #list == 0 then
t = "⌁ : لا توجد ميديا في المجموعة"
end
return LuaTele.editMessageText(ChatId,Msg_id,t,"md",true) end end
-- OR33
if Text and Text:match('(%d+)/Song') then
local UserId = Text:match('(%d+)/Song')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(itsspider.."spider:Status:distraction1"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"⌁ : عذراً امر غنيلي معطل",true) end 
Abs = math.random(4,2824); 
local Text ='⌁ : تم اختيار المقطع الصوتي لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'Song'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}}}
local msg_id = Msg_id/2097152/0.5
 https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. ChatId .. '&voice=https://t.me/AudiosDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end
--
elseif Text and Text:match('(%d+)/animation') then
local UserId = Text:match('(%d+)/animation')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(itsspider.."spider:Status:distraction2"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"⌁ : عذراً امر متحركه معطل",true) end 
Abs = math.random(4,1075); 
local Text ='⌁ : تم اختيار المتحركه لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'animation'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}}}
local msg_id = Msg_id/2097152/0.5
 https.request("https://api.telegram.org/bot"..Token..'/sendanimation?chat_id=' .. ChatId .. '&animation=https://t.me/GifDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end
--
elseif Text and Text:match('(%d+)/voice') then
local UserId = Text:match('(%d+)/voice')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(itsspider.."spider:Status:distraction3"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"⌁ : عذراً امر شعر معطل",true) end 
Abs = math.random(4,140); 
local Text ='⌁ : تم اختيار الشعر لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'voice'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}}}
local msg_id = Msg_id/2097152/0.5
 https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. ChatId .. '&voice=https://t.me/L1BBBL/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end
--
elseif Text and Text:match('(%d+)/Memz') then
local UserId = Text:match('(%d+)/Memz')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(itsspider.."spider:Status:distraction4"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"⌁ : عذراً امر ميمز معطل",true) end 
Abs = math.random(4,1201); 
local Text ='⌁ : تم اختيار الميمز لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'Memz'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}}}
local msg_id = Msg_id/2097152/0.5
 https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. ChatId .. '&voice=https://t.me/MemzDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end
--
elseif Text and Text:match('(%d+)/Remix') then
local UserId = Text:match('(%d+)/Remix')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(itsspider.."spider:Status:distraction5"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"⌁ : عذراً امر ريمكس معطل",true) end 
Abs = math.random(4,612); 
local Text ='⌁ : تم اختيار الريمكس لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'Remix'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}}}
local msg_id = Msg_id/2097152/0.5
 https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. ChatId .. '&voice=https://t.me/RemixDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end
--
elseif Text and Text:match('(%d+)/Movies') then
local UserId = Text:match('(%d+)/Movies')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(itsspider.."spider:Status:distraction6"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"⌁ : عذراً امر فلم معطل",true) end 
Abs = math.random(4,125); 
local Text ='⌁ : تم اختيار الفلم لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'Movies'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}}}
local msg_id = Msg_id/2097152/0.5
 https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. ChatId .. '&photo=https://t.me/MoviesDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end
--
elseif Text and Text:match('(%d+)/Anime') then
local UserId = Text:match('(%d+)/Anime')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(itsspider.."spider:Status:distraction7"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"⌁ : عذراً امر انمي معطل",true) end 
Abs = math.random(4,1002); 
local Text ='⌁ : تم اختيار الانمي لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'Anime'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}}}
local msg_id = Msg_id/2097152/0.5
 https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. ChatId .. '&photo=https://t.me/AnimeDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end
--
elseif Text and Text:match('(%d+)/Mp') then
local UserId = Text:match('(%d+)/Mp')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(itsspider.."spider:Status:distraction8"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"⌁ : عذراً امر اغنيه معطل",true) end 
Abs = math.random(4,1167); 
local Text ='⌁ : تم اختيار الاغنيه لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'Mp'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}}}
local msg_id = Msg_id/2097152/0.5
 https.request("https://api.telegram.org/bot"..Token..'/sendAudio?chat_id=' .. ChatId .. '&audio=https://t.me/DavidMp3/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end
--
elseif Text and Text:match('(%d+)/Photos') then
local UserId = Text:match('(%d+)/Photos')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(itsspider.."spider:Status:distraction9"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"⌁ : عذراً امر صوره معطل",true) end 
Abs = math.random(4,1171); 
local Text ='⌁ : تم اختيار الصوره لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'Photos'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}}}
local msg_id = Msg_id/2097152/0.5
 https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. ChatId .. '&photo=https://t.me/PhotosDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end
--
elseif Text and Text:match('(%d+)/Series') then
local UserId = Text:match('(%d+)/Series')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(itsspider.."spider:Status:distraction10"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"⌁ : عذراً امر مسلسل معطل",true) end 
Abs = math.random(4,54); 
local Text ='⌁ : تم اختيار المسلسل لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'Series'}},{{text='‹ Sourec F᥆Ꭱx ›',url="t.me/wwttw"}}}
local msg_id = Msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. ChatId .. '&photo=https://t.me/SeriesDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end end
-- OR33
if Text and Text:match('(%d+)/closerdControllerBot') then
local UserId = Text:match('(%d+)/closerdControllerBot')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Set:Manager:rd"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/DelDev') then
local UserId = Text:match('(%d+)/DelDev')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider..'spider:GetTexting:Devspider'..data.chat_id..':'..data.sender_user_id)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/DelOwner') then
local UserId = Text:match('(%d+)/DelOwner')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider..'spider:GetOwner:Ownerspider'..data.chat_id..':'..data.sender_user_id)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/closerdControllerBot') then
local UserId = Text:match('(%d+)/closerdControllerBot')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider11:Set:Rd"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/closerd0bot') then
local UserId = Text:match('(%d+)/closerd0bot')
if tonumber(IdUser) == tonumber(UserId) then
local test = Redis:get(itsspider.."spider11:Text:Sudo:Bot"..data.sender_user_id..":"..data.chat_id)
Redis:del(itsspider..'spider11:Add:Rd:Sudo:Text'..test)
Redis:del(itsspider..'spider11:Add:Rd:Sudo:Text1'..test)
Redis:del(itsspider..'spider11:Add:Rd:Sudo:Text2'..test)
Redis:del(itsspider.."spider11:Set:Rd"..data.sender_user_id..":"..data.chat_id)
Redis:srem(itsspider.."spider11:List:Rd:Sudo", test)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء حفظ الرد',"md",true) end end
--
if Text and Text:match('(%d+)/closerdclbot') then
local UserId = Text:match('(%d+)/closerdclbot')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider11:Set:Rd"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم انهاء وحفظ الردود',"md",true) end end
--
if Text and Text:match('(%d+)/closerddelbot') then
local UserId = Text:match('(%d+)/closerddelbot')
if tonumber(IdUser) == tonumber(UserId) then
local test = Redis:get(itsspider.."spider11:Text:Sudo:Bot"..data.sender_user_id..":"..data.chat_id)
Redis:del(itsspider..'spider11:Add:Rd:Sudo:Text'..test)
Redis:del(itsspider..'spider11:Add:Rd:Sudo:Text1'..test)
Redis:del(itsspider..'spider11:Add:Rd:Sudo:Text2'..test)
Redis:del(itsspider.."spider11:Set:Rd"..data.sender_user_id..":"..data.chat_id)
Redis:srem(itsspider.."spider11:List:Rd:Sudo", test)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء وحذف التخزين',"md",true) end end
--
if Text and Text:match('(%d+)/delrdOR33Rbot') then
local UserId = Text:match('(%d+)/delrdOR33Rbot')
if tonumber(IdUser) == tonumber(UserId) then
local test = Redis:get(itsspider.."spider11:Text:Sudo:Bot"..data.sender_user_id..":"..data.chat_id)
Redis:del(itsspider..'spider11:Add:Rd:Sudo:Text'..test)
Redis:del(itsspider..'spider11:Add:Rd:Sudo:Text1'..test)
Redis:del(itsspider..'spider11:Add:Rd:Sudo:Text2'..test)
Redis:del(itsspider.."spider11:Set:Rd"..data.sender_user_id..":"..data.chat_id)
Redis:srem(itsspider.."spider11:List:Rd:Sudo", test)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : الكلمة ↫ ‹ '..test..' › تم حذفها',"md",true) end end
--
if Text and Text:match('(%d+)/closedeleterdbot') then
local UserId = Text:match('(%d+)/closedeleterdbot')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider11:Set:On"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء الامر',"md",true) end end
---- OR33
if Text and Text:match('(%d+)/closerdManagers') then
local UserId = Text:match('(%d+)/closerdManagers')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider1:Set:Rd"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/closerd0') then
local UserId = Text:match('(%d+)/closerd0')
if tonumber(IdUser) == tonumber(UserId) then
local test = Redis:get(itsspider.."spider1:Text:Sudo:Bot"..data.sender_user_id..":"..data.chat_id)
Redis:del(itsspider..'spider1:Add:Rd:Sudo:Text'..test..data.chat_id)
Redis:del(itsspider..'spider1:Add:Rd:Sudo:Text1'..test..data.chat_id)
Redis:del(itsspider..'spider1:Add:Rd:Sudo:Text2'..test..data.chat_id)
Redis:del(itsspider..'spider1:Add:Rd:Sudo:Text3'..test..data.chat_id)
Redis:del(itsspider..'spider1:Add:Rd:Sudo:Text4'..test..data.chat_id)
Redis:del(itsspider.."spider1:Set:Rd"..data.sender_user_id..":"..data.chat_id)
Redis:srem(itsspider.."spider1:List:Rd:Sudo"..data.chat_id, test)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء حفظ الرد',"md",true) end end
--
if Text and Text:match('(%d+)/closerdcl') then
local UserId = Text:match('(%d+)/closerdcl')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider1:Set:Rd"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم انهاء وحفظ الردود',"md",true) end end
--
if Text and Text:match('(%d+)/closerddel') then
local UserId = Text:match('(%d+)/closerddel')
if tonumber(IdUser) == tonumber(UserId) then
local test = Redis:get(itsspider.."spider1:Text:Sudo:Bot"..data.sender_user_id..":"..data.chat_id)
Redis:del(itsspider..'spider1:Add:Rd:Sudo:Text'..test..data.chat_id)
Redis:del(itsspider..'spider1:Add:Rd:Sudo:Text1'..test..data.chat_id)
Redis:del(itsspider..'spider1:Add:Rd:Sudo:Text2'..test..data.chat_id)
Redis:del(itsspider..'spider1:Add:Rd:Sudo:Text3'..test..data.chat_id)
Redis:del(itsspider..'spider1:Add:Rd:Sudo:Text4'..test..data.chat_id)
Redis:del(itsspider.."spider1:Set:Rd"..data.sender_user_id..":"..data.chat_id)
Redis:srem(itsspider.."spider1:List:Rd:Sudo"..data.chat_id, test)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء وحذف التخزين',"md",true) end end
--
if Text and Text:match('(%d+)/delrdOR33R') then
local UserId = Text:match('(%d+)/delrdOR33R')
if tonumber(IdUser) == tonumber(UserId) then
local test = Redis:get(itsspider.."spider1:Text:Sudo:Bot"..data.sender_user_id..":"..data.chat_id)
Redis:del(itsspider..'spider1:Add:Rd:Sudo:Text'..test..data.chat_id)
Redis:del(itsspider..'spider1:Add:Rd:Sudo:Text1'..test..data.chat_id)
Redis:del(itsspider..'spider1:Add:Rd:Sudo:Text2'..test..data.chat_id)
Redis:del(itsspider.."spider1:Set:Rd"..data.sender_user_id..":"..data.chat_id)
Redis:srem(itsspider.."spider1:List:Rd:Sudo"..data.chat_id, test)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : الكلمة ↫ ‹ '..test..' › تم حذفها',"md",true) end end
--
if Text and Text:match('(%d+)/closedeleterd') then
local UserId = Text:match('(%d+)/closedeleterd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider1:Set:On"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء الامر',"md",true) end end
-- OR33
if Text and Text:match('(%d+)/closeRules') then
local UserId = Text:match('(%d+)/closeRules')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Set:Rules:" .. data.chat_id .. ":" .. data.sender_user_id)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/closeDescription') then
local UserId = Text:match('(%d+)/closeDescription')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Set:Description:" .. data.chat_id .. ":" .. data.sender_user_id)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/closeWelcome') then
local UserId = Text:match('(%d+)/closeWelcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."Tshake:Welcome:Group" .. data.chat_id .. "" .. data.sender_user_id)  
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/closeLINK') then
local UserId = Text:match('(%d+)/closeLINK')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Set:Link"..data.chat_id..""..data.sender_user_id) 
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء الامر',"md",true) end end
-- OR33
if Text and Text:match('(%d+)/closeRD') then
local UserId = Text:match('(%d+)/closeRD')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Set:Manager:rd"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/closerd') then
local UserId = Text:match('(%d+)/closerd')
if tonumber(IdUser) == tonumber(UserId) then
local test = Redis:get(itsspider.."spider:Text:Manager"..data.sender_user_id..":"..data.chat_id.."")
Redis:del(itsspider.."spider:Add:Rd:Manager:Gif"..test..data.chat_id)   
Redis:del(itsspider.."spider:Add:Rd:Manager:Vico"..test..data.chat_id)   
Redis:del(itsspider.."spider:Add:Rd:Manager:Stekrs"..test..data.chat_id)     
Redis:del(itsspider.."spider:Add:Rd:Manager:Text"..test..data.chat_id)   
Redis:del(itsspider.."spider:Add:Rd:Manager:Photo"..test..data.chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:Video"..test..data.chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:File"..test..data.chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:Audio"..test..data.chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:video_note"..test..data.chat_id)
Redis:del(itsspider.."spider:Set:Manager:rd"..data.sender_user_id..":"..data.chat_id)
Redis:srem(itsspider.."spider:List:Manager"..data.chat_id.."", test)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء حفظ الرد',"md",true) end end
--
if Text and Text:match('(%d+)/closerD') then
local UserId = Text:match('(%d+)/closerD')
if tonumber(IdUser) == tonumber(UserId) then
local test = Redis:get(itsspider.."spider:Text:Manager"..data.sender_user_id..":"..data.chat_id.."")
Redis:del(itsspider.."spider:Add:Rd:Manager:Gif"..test..data.chat_id)   
Redis:del(itsspider.."spider:Add:Rd:Manager:Vico"..test..data.chat_id)   
Redis:del(itsspider.."spider:Add:Rd:Manager:Stekrs"..test..data.chat_id)     
Redis:del(itsspider.."spider:Add:Rd:Manager:Text"..test..data.chat_id)   
Redis:del(itsspider.."spider:Add:Rd:Manager:Photo"..test..data.chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:Video"..test..data.chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:File"..test..data.chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:Audio"..test..data.chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:video_note"..test..data.chat_id)
Redis:del(itsspider.."spider:Set:Manager:rd"..data.sender_user_id..":"..data.chat_id)
Redis:srem(itsspider.."spider:List:Manager"..data.chat_id.."", test)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : الكلمة ↫ ‹ '..test..' › تم حذفها',"md",true) end end
-- OR33 --
if Text and Text:match('(%d+)/TkYes') then
local UserId = Text:match('(%d+)/TkYes')
if tonumber(IdUser) == tonumber(UserId) then 
if The_ControllerAll(IdUser) == true then
Rink = 1
elseif Redis:sismember(itsspider.."spider:DevelopersAS:Groups",IdUser)  then
Rink = 2
elseif Redis:sismember(itsspider.."spider:DevelopersQ:Groups",IdUser)  then
Rink = 3
elseif Redis:sismember(itsspider.."spider:Developers:Groups",IdUser)  then
Rink = 4
elseif Redis:sismember(itsspider.."spider:TheBasics:Group"..data.chat_id, IdUser) then
Rink = 5
elseif Redis:sismember(itsspider.."spider:Originators:Group"..data.chat_id, IdUser) then
Rink = 6
elseif Redis:sismember(itsspider.."spider:Managers:Group"..data.chat_id, IdUser) then
Rink = 7
elseif Redis:sismember(itsspider.."spider:Addictive:Group"..data.chat_id, IdUser) then
Rink = 8
elseif Redis:sismember(itsspider.."spider:Distinguished:Group"..data.chat_id, IdUser) then
Rink = 9
elseif Redis:sismember(itsspider.."spider:Cleaner:Group"..data.chat_id, IdUser) then
Rink = 10
else
Rink = 11
end
if Rink == 11 then return LuaTele.editMessageText(ChatId,Msg_id,"\n*⌁ : ليس لديك رتب عزيزي *","md",true)  end
if Rink <= 1  then return LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عذراً لا استطيع تنزيل المطور الاساسي","md",true) 
else
Redis:srem(itsspider.."spider:DevelopersAS:Groups", IdUser)
Redis:srem(itsspider.."spider:DevelopersQ:Groups", IdUser)
Redis:srem(itsspider.."spider:Developers:Groups", IdUser)
Redis:srem(itsspider.."spider:TheBasics:Group"..data.chat_id, IdUser)
Redis:srem(itsspider.."spider:Originators:Group"..data.chat_id, IdUser)
Redis:srem(itsspider.."spider:Managers:Group"..data.chat_id, IdUser)
Redis:srem(itsspider.."spider:Addictive:Group"..data.chat_id, IdUser)
Redis:srem(itsspider.."spider:Distinguished:Group"..data.chat_id, IdUser)
Redis:srem(itsspider.."spider:Cleaner:Group"..data.chat_id, IdUser)
return LuaTele.editMessageText(ChatId,Msg_id,"⌁ : تم تنزيلك من جميع الرتب ","md",true)  end end
end
--
if Text and Text:match('(%d+)/TkNo') then
local UserId = Text:match('(%d+)/TkNo')
if tonumber(IdUser) == tonumber(UserId) then 
return LuaTele.editMessageText(ChatId,Msg_id, '⌁ : تم الغاء عملية تنزيل رتبتك', 'md',true) end end
-- OR33 --
if Text and Text:match('(%d+)/Yesbot') then
local UserId = Text:match('(%d+)/Yesbot')
if tonumber(IdUser) == tonumber(UserId) then 
local list = Redis:smembers(itsspider.."spider:ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(data.chat_id)
if Get_Chat.id then
local statusMem = LuaTele.getChatMember(data.chat_id,spider)
if statusMem.status.luatele == "chatMemberStatusAdministrator" then
x = x + 1
LuaTele.editMessageText(ChatId,Msg_id,"*⌁ : تمت مغادرة المجموعة*","md",true)
Redis:srem(itsspider..'spider:ChekBotAdd',data.chat_id)
local keys = Redis:keys(itsspider..'*'..data.chat_id)
for i = 1, #keys do
Redis:del(keys[i]) end
LuaTele.leaveChat(data.chat_id) end
else
x = x + 1
local keys = Redis:keys(itsspider..'*'..v)
for i = 1, #keys do
Redis:del(keys[i]) end
Redis:srem(itsspider..'spider:ChekBotAdd',v)
LuaTele.leaveChat(v) end end end end
--
if Text and Text:match('(%d+)/Yesbott') then
local UserId = Text:match('(%d+)/Yesbott')
if tonumber(IdUser) == tonumber(UserId) then 
LuaTele.sendText(ChatId,Msg_id,"*⌁ : تمت مغادرة المجموعة*","md",true)  
local Left_Bot = LuaTele.leaveChat(data.chat_id) end end
--
if Text and Text:match('(%d+)/Nobot') then
local UserId = Text:match('(%d+)/Nobot')
if tonumber(IdUser) == tonumber(UserId) then 
return LuaTele.editMessageText(ChatId,Msg_id, '⌁ : تم الغاء عملية مغادرة البوت', 'md',true) end end
-- OR33 --
if Text and Text:match('(%d+)/Banme') then
local UserId = Text:match('(%d+)/Banme')
if tonumber(IdUser) == tonumber(UserId) then 
local StatusMember = LuaTele.getChatMember(data.chat_id,data.sender_user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
KickMe = true
elseif (StatusMember == "chatMemberStatusAdministrator") then
KickMe = true
else
KickMe = false end
if KickMe == true then return LuaTele.editMessageText(ChatId,Msg_id,"*⌁ : عذرا لا استطيع طرد ادمنيه ومنشئين المجموعة*","md",true)    
end
LuaTele.setChatMemberStatus(data.chat_id,data.sender_user_id,'banned',0)
return LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(data.sender_user_id,"⌁ : تم طردك من المجموعة بنائآ على طلبك").Reply,"md",true) end end
--
if Text and Text:match('(%d+)/noBanme') then
local UserId = Text:match('(%d+)/noBanme')
if tonumber(IdUser) == tonumber(UserId) then 
return LuaTele.editMessageText(ChatId,Msg_id, '⌁ : تم الغاء عملية طردك من المجموعة', 'md',true) end end
-- OR33 --
if Text and Text:match('(%d+)/RRDs') then
local UserId = Text:match('(%d+)/RRDs')
if tonumber(IdUser) == tonumber(UserId) then 
local list = Redis:smembers(itsspider.."spider:List:Rd:Sudo")
OR33 = "\n⌁ : قائمة ردود المطور ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(itsspider.."spider:Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(itsspider.."spider:Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(itsspider.."spider:Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🃏"
elseif Redis:get(itsspider.."spider:Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif Redis:get(itsspider.."spider:Add:Rd:Sudo:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(itsspider.."spider:Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(itsspider.."spider:Add:Rd:Sudo:File"..v) then
db = "ملف 📁"
elseif Redis:get(itsspider.."spider:Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(itsspider.."spider:Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
OR33 = OR33..""..k.." - ‹ `"..v.."` › ↫ ‹"..db.."›\n"
end
if #list == 0 then
OR33 = "⌁ : عذراً لا توجد ردود للمطور"
end
return LuaTele.editMessageText(ChatId,Msg_id,OR33,"md",true) end end
--
if Text and Text:match('(%d+)/RDs') then
local UserId = Text:match('(%d+)/RDs')
if tonumber(IdUser) == tonumber(UserId) then
local Rds = Redis:scard(itsspider.."spider:List:Rd:Sudo")
local list = Redis:smembers(itsspider.."spider:List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(itsspider.."spider:Add:Rd:Sudo:Gif"..v)   
Redis:del(itsspider.."spider:Add:Rd:Sudo:vico"..v)   
Redis:del(itsspider.."spider:Add:Rd:Sudo:stekr"..v)     
Redis:del(itsspider.."spider:Add:Rd:Sudo:Text"..v)   
Redis:del(itsspider.."spider:Add:Rd:Sudo:Photo"..v)
Redis:del(itsspider.."spider:Add:Rd:Sudo:Video"..v)
Redis:del(itsspider.."spider:Add:Rd:Sudo:File"..v)
Redis:del(itsspider.."spider:Add:Rd:Sudo:Audio"..v)
Redis:del(itsspider.."spider:Add:Rd:Sudo:video_note"..v)
Redis:del(itsspider.."spider:List:Rd:Sudo") end
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم حذف ‹ '..Rds..' › من ردود المطور',"md",true) end end
--
if Text and Text:match('(%d+)/RSoOR33') then
local UserId = Text:match('(%d+)/RSoOR33')
if tonumber(IdUser) == tonumber(UserId) then 
local list = Redis:smembers(itsspider.."spider11:List:Rd:Sudo")
OR33 = "\n⌁ : قائمة الردود المتعدده العامه ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
db = "رساله ✉"
OR33 = OR33..""..k.." - ‹ `"..v.."` › ↫ ‹"..db.."›\n"
end
if #list == 0 then
OR33 = "⌁ : لا توجد ردود متعدده عامه"
end
return LuaTele.editMessageText(ChatId,Msg_id,OR33,"md",true) end end
--
if Text and Text:match('(%d+)/RSoOR33') then
local UserId = Text:match('(%d+)/RSoOR33')
if tonumber(IdUser) == tonumber(UserId) then
local R = Redis:scard(itsspider.."spider11:List:Rd:Sudo")
local list = Redis:smembers(itsspider.."spider11:List:Rd:Sudo")
for k,v in pairs(list) do  
Redis:del(itsspider.."spider11:Add:Rd:Sudo:Text"..v) 
Redis:del(itsspider.."spider11:Add:Rd:Sudo:Text1"..v) 
Redis:del(itsspider.."spider11:Add:Rd:Sudo:Text2"..v)   
Redis:del(itsspider.."spider11:List:Rd:Sudo") end
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم حذف ‹ '..R..' › من ردود المتعدده العامه',"md",true) end end
--
if Text and Text:match('(%d+)/OR33closeSo') then
local UserId = Text:match('(%d+)/OR33closeSo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Set:On"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/DevIDClose') then
local UserId = Text:match('(%d+)/DevIDClose')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:AddSudosNew"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء الامر',"md",true) end end
-- OR33 --
if Text and Text:match('(%d+)/RdOR33') then
local UserId = Text:match('(%d+)/RdOR33')
if tonumber(IdUser) == tonumber(UserId) then 
local list = Redis:smembers(itsspider.."spider1:List:Rd:Sudo"..data.chat_id)
OR33 = "\n⌁ : قائمة الردود المتعدده ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
db = "رساله ✉"
OR33 = OR33..""..k.." - ‹ `"..v.."` › ↫ ‹"..db.."›\n"
end
if #list == 0 then
OR33 = "⌁ : لا توجد ردود متعدده"
end
return LuaTele.editMessageText(ChatId,Msg_id,OR33,"md",true) end end
--
if Text and Text:match('(%d+)/RdOR33') then
local UserId = Text:match('(%d+)/RdOR33')
if tonumber(IdUser) == tonumber(UserId) then
local R = Redis:scard(itsspider.."spider1:List:Rd:Sudo"..data.chat_id)
local list = Redis:smembers(itsspider.."spider1:List:Rd:Sudo"..data.chat_id)
for k,v in pairs(list) do  
Redis:del(itsspider.."spider1:Add:Rd:Sudo:Text"..v..data.chat_id) 
Redis:del(itsspider.."spider1:Add:Rd:Sudo:Text1"..v..data.chat_id) 
Redis:del(itsspider.."spider1:Add:Rd:Sudo:Text2"..v..data.chat_id) 
Redis:del(itsspider.."spider1:List:Rd:Sudo"..data.chat_id) end
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم حذف ‹ '..R..' › من ردود المتعدده',"md",true) end end
--
if Text and Text:match('(%d+)/RRD') then
local UserId = Text:match('(%d+)/RRD')
if tonumber(IdUser) == tonumber(UserId) then 
local list = Redis:smembers(itsspider.."spider:List:Manager"..data.chat_id.."")
OR33 = "⌁ : قائمة ردود المدير ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(itsspider.."spider:Add:Rd:Manager:Gif"..v..data.chat_id) then
db = "متحركه 🎭"
elseif Redis:get(itsspider.."spider:Add:Rd:Manager:Vico"..v..data.chat_id) then
db = "بصمه 📢"
elseif Redis:get(itsspider.."spider:Add:Rd:Manager:Stekrs"..v..data.chat_id) then
db = "ملصق 🃏"
elseif Redis:get(itsspider.."spider:Add:Rd:Manager:Text"..v..data.chat_id) then
db = "رساله ✉"
elseif Redis:get(itsspider.."spider:Add:Rd:Manager:Photo"..v..data.chat_id) then
db = "صوره 🎇"
elseif Redis:get(itsspider.."spider:Add:Rd:Manager:Video"..v..data.chat_id) then
db = "فيديو 📹"
elseif Redis:get(itsspider.."spider:Add:Rd:Manager:File"..v..data.chat_id) then
db = "ملف 📁"
elseif Redis:get(itsspider.."spider:Add:Rd:Manager:Audio"..v..data.chat_id) then
db = "اغنيه 🎵"
elseif Redis:get(itsspider.."spider:Add:Rd:Manager:video_note"..v..data.chat_id) then
db = "فيديو نوت 🎥"
end
OR33 = OR33..""..k.." - ‹ `"..v.."` › ↫ ‹"..db.."›\n"
end
if #list == 0 then
OR33 = "⌁ : عذرا لا يوجد ردود للمدير في المجموعة"
end
LuaTele.editMessageText(ChatId,Msg_id,OR33, 'md', true) end end
--
if Text and Text:match('(%d+)/RD') then
local UserId = Text:match('(%d+)/RD')
if tonumber(IdUser) == tonumber(UserId) then
local R = Redis:scard(itsspider.."spider:List:Manager"..data.chat_id.."")
local list = Redis:smembers(itsspider.."spider:List:Manager"..data.chat_id.."")
for k,v in pairs(list) do
Redis:del(itsspider.."spider:Add:Rd:Manager:Gif"..v..data.chat_id)   
Redis:del(itsspider.."spider:Add:Rd:Manager:Vico"..v..data.chat_id)   
Redis:del(itsspider.."spider:Add:Rd:Manager:Stekrs"..v..data.chat_id)     
Redis:del(itsspider.."spider:Add:Rd:Manager:Text"..v..data.chat_id)   
Redis:del(itsspider.."spider:Add:Rd:Manager:Photo"..v..data.chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:Video"..v..data.chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:File"..v..data.chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:video_note"..v..data.chat_id)
Redis:del(itsspider.."spider:Add:Rd:Manager:Audio"..v..data.chat_id)
Redis:del(itsspider.."spider:List:Manager"..data.chat_id) end
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم حذف ‹ '..R..' › من ردود المدير',"md",true)  end 
end
--
if Text and Text:match('(%d+)/OR33close') then
local UserId = Text:match('(%d+)/OR33close')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Set:Manager:rd"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : تم الغاء الامر',"md",true) end end
-- OR33 --
if Text and Text:match('(%d+)/activation') then
local UserId = Text:match('(%d+)/activation')
if tonumber(IdUser) == tonumber(UserId) then
local Get_Chat = LuaTele.getChat(data.chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(data.chat_id)
if Redis:sismember(itsspider.."spider:ChekBotAdd",data.chat_id) then return LuaTele.editMessageText(ChatId,Msg_id, '\n⌁ : المجموعة تم تفعيلها بالتأكيد' ,"md",true)  
else
local Info_Members = LuaTele.getSupergroupMembers(data.chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(itsspider.."spider:TheBas:Group"..data.chat_id,v.member_id.user_id) 
x = x + 1 end end
end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رفع الادمنيه ›', data = UserId..'/'.. 'addAdmins@'..data.chat_id},{text = '‹ تفعيل الحمايه ›', data = UserId..'/'.. 'LockAllGroup@'..data.chat_id},},{{text = '‹ الاوامر ›', data = UserId..'/'.. 'helpall'},},{{text = '‹ غادر ›', data = UserId..'/'..'Yesbot'},{text = '‹ تعطيل ›', data = UserId..'/'..'disable'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
Redis:sadd(itsspider.."spider:ChekBotAdd",data.chat_id)
Redis:set(itsspider.."spider:Status:Id"..data.chat_id,true) ;Redis:set(itsspider.."spider:Status:Reply"..data.chat_id,true) ;Redis:set(itsspider.."spider:Status:ReplySudo"..data.chat_id,true) ;Redis:set(itsspider.."spider:Status:BanId"..data.chat_id,true) ;Redis:set(itsspider.."spider:Status:SetId"..data.chat_id,true) 
return LuaTele.sendText(ChatId,Msg_id,'*⌁ : تم اعادة تفعيل المجموعة ↫ ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ›*','md', true, false, false, false, reply_markup) end end 
end
--
if Text and Text:match('(%d+)/disable') then
local UserId = Text:match('(%d+)/disable')
if tonumber(IdUser) == tonumber(UserId) then
local Get_Chat = LuaTele.getChat(data.chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(data.chat_id)
if not Redis:sismember(itsspider.."spider:ChekBotAdd",data.chat_id) then return LuaTele.editMessageText(ChatId,Msg_id, '\n⌁ : المجموعة تم تعطيلها بالتأكيد',"md",true)  
else
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ غادر ›', data = UserId..'/'..'Yesbot'},{text = '‹ تفعيل ›', data = UserId..'/'..'activation'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
Redis:srem(itsspider.."spider:ChekBotAdd",data.chat_id)
return LuaTele.sendText(ChatId,Msg_id,'*⌁ : تم تعطيل المجموعة ↫ ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ›*','md',true, false, false, false, reply_markup) end end
end
-- Lar Bot end --

if Text and Text:match('(%d+)/LinKTexT') then
local UserId = Text:match('(%d+)/LinKTexT')
if tonumber(IdUser) == tonumber(UserId) then 
local Get_Chat = LuaTele.getChat(data.chat_id) 
local GetLink = Redis:get(itsspider.."spider:Group:Link"..data.chat_id) 
if GetLink then
local Text = '⌔︙Link Group ↬ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nᅠ❨ '..GetLink..' ❩ '
keyboard = {} 
keyboard.inline_keyboard = {{{text= Get_Chat.title, url=GetLink}}}
local msg_id = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..ChatId..'&message_id='..msg_id..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
local LinkGroup = json:decode(https.request('https://api.telegram.org/bot'..Token..'/exportChatInviteLink?chat_id='..data.chat_id))
if LinkGroup.ok == true then
local Text = '⌔︙Link Group ↬ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nᅠ❨ '..LinkGroup.result..' ❩ '
keyboard = {} 
keyboard.inline_keyboard = {{{text= Get_Chat.title,url=LinkGroup.result}}}
local msg_id = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..ChatId..'&message_id='..msg_id..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
end


if Text and Text:match('(%d+)/LinKOnla') then
local UserId = Text:match('(%d+)/LinKOnla')
if tonumber(IdUser) == tonumber(UserId) then 
local Get_Chat = LuaTele.getChat(data.chat_id) 
local GetLink = Redis:get(itsspider.."spider:Group:Link"..data.chat_id) 
if GetLink then
local Text = '⌔︙Link Group ↬ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nᅠᅠᅠᅠ❨ ['..Get_Chat.title.. ']('..GetLink..') ❩ '
keyboard = {} 
keyboard.inline_keyboard = {{{text= Get_Chat.title, url=GetLink}}}
local msg_id = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..ChatId..'&message_id='..msg_id..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
local LinkGroup = json:decode(https.request('https://api.telegram.org/bot'..Token..'/exportChatInviteLink?chat_id='..data.chat_id))
if LinkGroup.ok == true then
local Text = '⌔︙Link Group ↬ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nᅠᅠᅠᅠ❨ ['..Get_Chat.title.. ']('..LinkGroup.result..') ❩ '
keyboard = {} 
keyboard.inline_keyboard = {{{text= Get_Chat.title,url= LinkGroup.result}}}
local msg_id = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..ChatId..'&message_id='..msg_id..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
end


-- Lar Banme --
if Text and Text:match('/Mahibes(%d+)') then
local GetMahibes = Text:match('/Mahibes(%d+)') 
local NumMahibes = math.random(1,6)
if tonumber(GetMahibes) == tonumber(NumMahibes) then
Redis:incrby(itsspider.."spider:Num:Add:Games"..ChatId..IdUser, 1)  
MahibesText = '*⌁ : الف مبروك حظك حلو اليوم\n⌁ : فزت ويانه وطلعت المحيبس بل عظمه رقم ‹ '..NumMahibes..' ›*'
else
MahibesText = '*⌁ : للاسف لقد خسرت المحيبس بالعظمه رقم ‹ '..NumMahibes..' ›\n⌁ : جرب حضك ويانه مره اخره*'
end
if NumMahibes == 1 then
Mahibes1 = '🤚' else Mahibes1 = '👊'
end
if NumMahibes == 2 then
Mahibes2 = '🤚' else Mahibes2 = '👊🏻'
end
if NumMahibes == 3 then
Mahibes3 = '🤚' else Mahibes3 = '👊🏼' 
end
if NumMahibes == 4 then
Mahibes4 = '🤚' else Mahibes4 = '👊🏽'
end
if NumMahibes == 5 then
Mahibes5 = '🤚' else Mahibes5 = '👊🏾'
end
if NumMahibes == 6 then
Mahibes6 = '🤚' else Mahibes6 = '👊🏿'
end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Mahibes1..'', data = '/*'}, {text = ''..Mahibes2..'', data = '/*'},},{{text = ''..Mahibes3..'', data = '/*'}, {text = ''..Mahibes4..'', data = '/*'},},{{text = ''..Mahibes5..'', data = '/*'}, {text = ''..Mahibes6..'', data = '/*'},},{{text = 'اللعب مره اخرى', data = '/MahibesAgane'},},}}
return LuaTele.editMessageText(ChatId,Msg_id,MahibesText, 'md', true, false, reply_markup) end
if Text == "/MahibesAgane" then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '👊', data = '/Mahibes1'}, {text = '👊🏻', data = '/Mahibes2'},},{{text = '👊🏼', data = '/Mahibes3'}, {text = '👊🏽', data = '/Mahibes4'},},{{text = '👊🏾', data = '/Mahibes5'}, {text = '👊🏿', data = '/Mahibes6'},},}}
local TextMahibesAgane = [[*
⌁ : لعبه المحيبس هي لعبة الحظ
⌁ : كل ما عليك هوا الضغط على احدى العضمات في الازرار
*]]
return LuaTele.editMessageText(ChatId,Msg_id,TextMahibesAgane, 'md', true, false, reply_markup) end
if Text and Text:match('(%d+)/help1') then
local UserId = Text:match('(%d+)/help1')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اوامر الادمنيه', data = IdUser..'/help2'},},{{text = 'اوامر المدراء', data = IdUser..'/help3'}, {text = 'اوامر المنشئين', data = IdUser..'/help4'},},{{text = 'اوامر المطورين', data = IdUser..'/help5'}, {text = 'العاب البوت', data = IdUser..'/help6'},},{{text = '‹ القائمه الرئيسيه › ', data = IdUser..'/helpall'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
local TextHelp = [[*
⌁ : اوامر الحمايه الخاصه بالمجموعة ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : قفل • فتح + الامر ↫ ‹ بالتقيد • بالطرد • بالكتم ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : الروابط
⌁ : المعرف
⌁ : التاك
⌁ : الشارحه
⌁ : التعديل
⌁ : التثبيت
⌁ : المتحركه
⌁ : الملفات
⌁ : الصور
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : الماركداون
⌁ : البوتات
⌁ : التكرار
⌁ : الكلايش
⌁ : السيلفي
⌁ : الملصقات
⌁ : الفيديو
⌁ : الكفر
⌁ : الفشار
⌁ : الطائفيه
⌁ : الانلاين
⌁ : الدردشه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : التوجيه
⌁ : الاغاني
⌁ : الصوت
⌁ : الجهات
⌁ : الاشعارات
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/degm') then
local UserId = Text:match('(%d+)/degm')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{{text = 'فلابي بيرد', url="https://t.me/awesomebot?game=FlappyBird"},{text = 'تحداني فالرياضيات',url="https://t.me/gamebot?game=MathBattle"}},   
{{text = 'لعبه دراجات', url="https://t.me/gamee?game=MotoFX"},{text = 'سباق سيارات', url="https://t.me/gamee?game=F1Racer"}}, 
{{text = 'تشابه', url="https://t.me/gamee?game=DiamondRows"},{text = 'كره القدم', url="https://t.me/gamee?game=FootballStar"}}, 
{{text = 'ورق', url="https://t.me/gamee?game=Hexonix"},{text = 'لعبه 2048', url="https://t.me/awesomebot?game=g2048"}}, 
{{text = 'المربعات', url="https://t.me/gamee?game=Squares"},{text = 'ATOMIC', url="https://t.me/gamee?game=AtomicDrop1"}}, 
{{text = 'كورسايرس', url="https://t.me/gamebot?game=Corsairs"},{text = 'LumberJack', url="https://t.me/gamebot?game=LumberJack"}}, 
{{text = 'ليتل بلاند', url="https://t.me/gamee?game=LittlePlane"},{text = 'RollerDisco', url="https://t.me/gamee?game=RollerDisco"}},  
{{text = 'كره القدم 2', url="https://t.me/gamee?game=PocketWorldCup"},{text = 'جمع المياه', url="https://t.me/gamee?game=BlockBuster"}},  
{{text = 'لا تجعلها تسقط', url="https://t.me/gamee?game=Touchdown"},{text = 'GravityNinja', url="https://t.me/gamee?game=GravityNinjaEmeraldCity"}},  
{{text = 'أستروكات', url="https://t.me/gamee?game=Astrocat"},{text = 'Skipper', url="https://t.me/gamee?game=Skipper"}},  
{{text = 'كأس العالم', url="https://t.me/gamee?game=PocketWorldCup"},{text = 'GeometryRun', url="https://t.me/gamee?game=GeometryRun"}},  
{{text = 'Ten2One', url="https://t.me/gamee?game=Ten2One"},{text = 'NeonBlast2', url="https://t.me/gamee?game=NeonBlast2"}},  
{{text = 'با', url="https://t.me/gamee?game=Paintio"},{text = 'onetwothree', url="https://t.me/gamee?game=onetwothree"}},  
{{text = 'بريكستاكر', url="https://t.me/gamee?game=BrickStacker"},{text = 'StairMaster3D', url="https://t.me/gamee?game=StairMaster3D"}},  
{{text = 'تحميلالفان', url="https://t.me/gamee?game=LoadTheVan"},{text = 'BasketBoyRush', url="https://t.me/gamee?game=BasketBoyRush"}},  
{{text = 'الجاذبية نينجا21', url="https://t.me/gamee?game=GravityNinja21"},{text = 'MarsRover', url="https://t.me/gamee?game=MarsRover"}},  
{{text = 'تحميلالفان', url="https://t.me/gamee?game=LoadTheVan"},{text = 'GroovySki', url="https://t.me/gamee?game=GroovySki"}},  
{{text = 'الرسامت تيمز', url="https://t.me/gamee?game=PaintioTeams"},{text = 'KeepItUp', url="https://t.me/gamee?game=KeepItUp"}},  
{{text = 'صن شاين سوليتير', url="https://t.me/gamee?game=SunshineSolitaire"},{text = 'Qubo', url="https://t.me/gamee?game=Qubo"}},  
{{text = 'عقوبة مطلق النار2', url="https://t.me/gamee?game=PenaltyShooter2"},{text = 'Getaway', url="https://t.me/gamee?game=Getaway"}},  
{{text = 'الرسامت تيمز', url="https://t.me/gamee?game=PaintioTeams"},{text = 'SpikyFish2', url="https://t.me/gamee?game=SpikyFish2"}},  
{{text = 'جروفيسكي', url="https://t.me/gamee?game=GroovySki"},{text = 'KungFuInc', url="https://t.me/gamee?game=KungFuInc"}},  
{{text = 'سبيس ترافلر', url="https://t.me/gamee?game=SpaceTraveler"},{text = 'RedAndBlue', url="https://t.me/gamee?game=RedAndBlue"}},  
{{text = 'سكوداهوكي1 ', url="https://t.me/gamee?game=SkodaHockey1"},{text = 'SummerLove', url="https://t.me/gamee?game=SummerLove"}},  
{{text = 'سمارتوبشارك', url="https://t.me/gamee?game=SmartUpShark"},{text = 'SpikyFish3', url="https://t.me/gamee?game=SpikyFish3"}},  
{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'}},
{
{text = '- اخفاء الامر ', data =IdUser..'/'.. 'delAmr'}
},
}
}
local TextHelp = [[*
• مرحبا بك في الالعاب الاحترافيه الخاص بسورس فروكس 
• اختر اللعبه ثم اختار المحادثة التي تريد اللعب بها
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)end
elseif Text and Text:match('(%d+)/help2') then
local UserId = Text:match('(%d+)/help2')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اوامر الحمايه', data = IdUser..'/help1'},},{{text = 'اوامر المدراء', data = IdUser..'/help3'}, {text = 'اوامر المنشئين', data = IdUser..'/help4'},},{{text = 'اوامر المطورين', data = IdUser..'/help5'}, {text = 'العاب البوت', data = IdUser..'/help6'},},{{text = '‹ القائمه الرئيسيه › ', data = IdUser..'/helpall'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
local TextHelp = [[*
⌁ : اوامر ادمنية ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : رفع • تنزيل ↫ مميز
⌁ : تاك للكل • عدد الكروب
⌁ : كتم • حظر • طرد • تقيد
⌁ : الغاء كتم • الغاء حظر • الغاء تقيد
⌁ : منع • الغاء منع
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : عرض القوائم ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : المكتومين
⌁ : المميزين
⌁ : قائمه المنع
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : تثبيت • الغاء تثبيت
⌁ : الرابط • الاعدادات
⌁ : الترحيب • القوانين
⌁ : تفعيل • تعطيل ↫ الترحيب
⌁ : تفعيل • تعطيل ↫ الرابط
⌁ : جهاتي • ايدي • رسائلي
⌁ : سحكاتي • مجوهراتي
⌁ : كشف البوتات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : وضع • ضع الاوامر التاليه ↫ ⤈
⌁ : اسم • رابط • صوره
⌁ : قوانين • وصف • ترحيب
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : حذف • مسح الاوامر التاليه ↫ ⤈
⌁ : قائمه المنع • المحظورين
⌁ : المميزين • المكتومين • القوانين
⌁ : المطرودين • البوتات • الصوره • الرابط
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/help3') then
local UserId = Text:match('(%d+)/help3')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اوامر الحمايه', data = IdUser..'/help1'}, {text = 'اوامر الادمنيه', data = IdUser..'/help2'},},{{text = 'اوامر المنشئين', data = IdUser..'/help4'},},{{text = 'اوامر المطورين', data = IdUser..'/help5'}, {text = 'العاب البوت', data = IdUser..'/help6'},},{{text = '‹ القائمه الرئيسيه › ', data = IdUser..'/helpall'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
local TextHelp = [[*
⌁ : اوامر المدراء ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : رفع • تنزيل ↫ ادمن
᥀️︙رفع • كشف ↫ القيود
⌁ : تنزيل الكل ↫ ‹ بالرد • بالمعرف ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : تغيير رد الرتب في البوت ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : تغير رد + اسم الرتبه والنص
⌁ : المطور • المنشئ الاساسي
⌁ : المنشئ • المدير • الادمن
⌁ : المميز • العضو
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : تفعيل • تعطيل الاوامر التاليه ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : الايدي • الايدي بالصوره
⌁ : ردود المطور • ردود المدير
⌁ : اطردني • الالعاب • الرفع
⌁ : الحظر • الرابط •
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : تعين • مسح ↫الايدي
⌁ : رفع الادمنيه • مسح الادمنيه
⌁ : ردود المدير • مسح ردود المدير
⌁ : اضف • حذف + رد
⌁ : تنظيف + عدد
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/help4') then
local UserId = Text:match('(%d+)/help4')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اوامر الحمايه', data = IdUser..'/help1'}, {text = 'اوامر الادمنيه', data = IdUser..'/help2'},},{{text = 'اوامر المدراء', data = IdUser..'/help3'},},{{text = 'اوامر المطورين', data = IdUser..'/help5'}, {text = 'العاب البوت', data = IdUser..'/help6'},},{{text = '‹ القائمه الرئيسيه › ', data = IdUser..'/helpall'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
local TextHelp = [[*
⌁ : اوامر المنشئ الاساسي ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : رفع • تنزيل ↫ منشئ
⌁ : المنشئين • مسح المنشئين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : اوامر المنشئ المجموعة ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : رفع • تنزيل ↫ مدير
⌁ : المدراء • مسح المدراء
⌁ : اضف رسائل ↫ ‹ بالرد • بالايدي ›
⌁ : اضف مجوهرات ↫ ‹ بالرد • بالايدي ›
⌁ : اضف • حذف + الامر
⌁ : الاوامر المضافه • مسح الاوامر المضافه
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/help5') then
local UserId = Text:match('(%d+)/help5')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اوامر الحمايه', data = IdUser..'/help1'}, {text = 'اوامر الادمنيه', data = IdUser..'/help2'},},{{text = 'اوامر المدراء', data = IdUser..'/help3'}, {text = 'اوامر المنشئين', data = IdUser..'/help4'},},{{text = 'العاب البوت', data = IdUser..'/help6'},},{{text = '‹ القائمه الرئيسيه › ', data = IdUser..'/helpall'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
local TextHelp = [[*
⌁ : اوامر المطور الاساسي ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : حظر عام • الغاء العام
⌁ : رفع • تنزيل ↫ مطور
⌁ : قائمه العام • مسح قائمه العام
⌁ : المطورين • مسح المطورين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : اضف • حذف ↫ رد للكل
⌁ : وضع • حذف ↫ كليشة المطور
⌁ : مسح ردود المطور • ردود المطور
⌁ : تحديث •  تحديث السورس
⌁ : تعين عدد الاعضاء + العدد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : تفعيل • تعطيل الاوامر التاليه ↫ ⤈
⌁ : البوت الخدمي • المغادرة • الاذاعه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : اوامر المطور في البوت ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : تفعيل • تعطيل • الاحصائيات
⌁ : رفع • تنزيل ↫ منشئ اساسي
⌁ : مسح الاساسين • المنشئين الاساسين
⌁ : غادر • غادر + الايدي
⌁ : اذاعه • اذاعه بالتوجيه • اذاعه بالتثبيت
⌁ : اذاعه خاص • اذاعه خاص بالتوجيه 
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/help6') then
local UserId = Text:match('(%d+)/help6')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اوامر الحمايه', data = IdUser..'/help1'}, {text = 'اوامر الادمنيه', data = IdUser..'/help2'},},{{text = 'اوامر المدراء', data = IdUser..'/help3'}, {text = 'اوامر المنشئين', data = IdUser..'/help4'},},{{text = 'اوامر المطورين', data = IdUser..'/help5'},},{{text = '‹ القائمه الرئيسيه › ', data = IdUser..'/helpall'},},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
local TextHelp = [[*
⌁ : قائمه الالعاب البوت ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : لعبة المختلف ↫ المختلف
⌁ : لعبة الامثله ↫ امثله
⌁ : لعبة العكس ↫ العكس
⌁ : لعبة الحزوره ↫ حزوره
⌁ : لعبة المعاني ↫ معاني
⌁ : لعبة البات ↫ بات
⌁ : لعبة التخمين ↫ خمن
⌁ : لعبه الاسرع ↫ الاسرع
⌁ : لعبة السمايلات ↫ سمايلات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : مجوهراتي ↫ لعرض عدد الارباح
⌁ : بيع مجوهراتي + العدد ↫ لبيع المجوهرات كل مجوهره مقابل ‹ 50 › رساله
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/helpall') then
local UserId = Text:match('(%d+)/helpall')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اوامر الحمايه', data = IdUser..'/help1'}, {text = 'اوامر الادمنيه', data = IdUser..'/help2'},},{{text = 'اوامر المدراء', data = IdUser..'/help3'}, {text = 'اوامر المنشئين', data = IdUser..'/help4'},},{{text = 'اوامر المطورين', data = IdUser..'/help5'}, {text = 'العاب البوت', data = IdUser..'/help6'},},{{text = 'القفل والفتح', data = IdUser..'/NoNextSeting'}, {text = 'التفعيل والتعطيل', data = IdUser..'/listallAddorrem'},},{{text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. 'delAmr'}},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
local TextHelp = [[*
⌁ : اهلا بك في قائمة الاوامر ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⌁ : م1 ↫ اوامر الحمايه
⌁ : م2 ↫ اوامر الادمنيه
⌁ : م3 ↫ اوامر المدراء
⌁ : م4 ↫ اوامر المنشئين
⌁ : م5 ↫ اوامر المطورين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup) end end
if Text and Text:match('(%d+)/lock_link') then
local UserId = Text:match('(%d+)/lock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Link"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الروابط").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_spam') then
local UserId = Text:match('(%d+)/lock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Spam"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الكلايش").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_keypord') then
local UserId = Text:match('(%d+)/lock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Keyboard"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الكيبورد").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_voice') then
local UserId = Text:match('(%d+)/lock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:vico"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الاغاني").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_gif') then
local UserId = Text:match('(%d+)/lock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Animation"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل المتحركات").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_files') then
local UserId = Text:match('(%d+)/lock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Document"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الملفات").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_text') then
local UserId = Text:match('(%d+)/lock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:text"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الدردشه").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_video') then
local UserId = Text:match('(%d+)/lock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Video"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الفيديو").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_photo') then
local UserId = Text:match('(%d+)/lock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Photo"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الصور").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_username') then
local UserId = Text:match('(%d+)/lock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:User:Name"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل المعرفات").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_tags') then
local UserId = Text:match('(%d+)/lock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:hashtak"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل التاك").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_bots') then
local UserId = Text:match('(%d+)/lock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Bot:kick"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل البوتات").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_fwd') then
local UserId = Text:match('(%d+)/lock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:forward"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل التوجيه").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_audio') then
local UserId = Text:match('(%d+)/lock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Audio"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الصوت").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_stikear') then
local UserId = Text:match('(%d+)/lock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Sticker"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الملصقات").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_phone') then
local UserId = Text:match('(%d+)/lock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Contact"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الجهات").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_joine') then
local UserId = Text:match('(%d+)/lock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Join"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الدخول").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_addmem') then
local UserId = Text:match('(%d+)/lock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:AddMempar"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الاضافه").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_videonote') then
local UserId = Text:match('(%d+)/lock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Unsupported"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل بصمه الفيديو").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_pin') then
local UserId = Text:match('(%d+)/lock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:lockpin"..ChatId,(LuaTele.getChatPinnedMessage(ChatId).id or true)) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل التثبيت").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_tgservir') then
local UserId = Text:match('(%d+)/lock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:tagservr"..ChatId,true)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الاشعارات").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_markdaun') then
local UserId = Text:match('(%d+)/lock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Markdaun"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الماركدون").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_edits') then
local UserId = Text:match('(%d+)/lock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:edit"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل التعديل").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_games') then
local UserId = Text:match('(%d+)/lock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:geam"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الالعاب").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_flood') then
local UserId = Text:match('(%d+)/lock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(itsspider.."spider:Spam:Group:User"..ChatId ,"Spam:User","del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل التكرار").Lock, 'md', true, false, reply_markup) end end
if Text and Text:match('(%d+)/lock_linkkid') then
local UserId = Text:match('(%d+)/lock_linkkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Link"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الروابط").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_spamkid') then
local UserId = Text:match('(%d+)/lock_spamkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Spam"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الكلايش").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_keypordkid') then
local UserId = Text:match('(%d+)/lock_keypordkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Keyboard"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الكيبورد").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_voicekid') then
local UserId = Text:match('(%d+)/lock_voicekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:vico"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الاغاني").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_gifkid') then
local UserId = Text:match('(%d+)/lock_gifkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Animation"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل المتحركات").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_fileskid') then
local UserId = Text:match('(%d+)/lock_fileskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Document"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الملفات").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_videokid') then
local UserId = Text:match('(%d+)/lock_videokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Video"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الفيديو").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_photokid') then
local UserId = Text:match('(%d+)/lock_photokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Photo"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الصور").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_usernamekid') then
local UserId = Text:match('(%d+)/lock_usernamekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:User:Name"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل المعرفات").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_tagskid') then
local UserId = Text:match('(%d+)/lock_tagskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:hashtak"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل التاك").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_fwdkid') then
local UserId = Text:match('(%d+)/lock_fwdkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:forward"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل التوجيه").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_audiokid') then
local UserId = Text:match('(%d+)/lock_audiokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Audio"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الصوت").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_stikearkid') then
local UserId = Text:match('(%d+)/lock_stikearkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Sticker"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الملصقات").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_phonekid') then
local UserId = Text:match('(%d+)/lock_phonekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Contact"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الجهات").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_videonotekid') then
local UserId = Text:match('(%d+)/lock_videonotekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Unsupported"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل بصمه الفيديو").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_markdaunkid') then
local UserId = Text:match('(%d+)/lock_markdaunkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Markdaun"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الماركدون").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_gameskid') then
local UserId = Text:match('(%d+)/lock_gameskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:geam"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الالعاب").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_floodkid') then
local UserId = Text:match('(%d+)/lock_floodkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(itsspider.."spider:Spam:Group:User"..ChatId ,"Spam:User","keed")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل التكرار").lockKid, 'md', true, false, reply_markup) end end
if Text and Text:match('(%d+)/lock_linkktm') then
local UserId = Text:match('(%d+)/lock_linkktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Link"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الروابط").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_spamktm') then
local UserId = Text:match('(%d+)/lock_spamktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Spam"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الكلايش").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_keypordktm') then
local UserId = Text:match('(%d+)/lock_keypordktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Keyboard"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الكيبورد").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_voicektm') then
local UserId = Text:match('(%d+)/lock_voicektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:vico"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الاغاني").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_gifktm') then
local UserId = Text:match('(%d+)/lock_gifktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Animation"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل المتحركات").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_filesktm') then
local UserId = Text:match('(%d+)/lock_filesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Document"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الملفات").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_videoktm') then
local UserId = Text:match('(%d+)/lock_videoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Video"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الفيديو").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_photoktm') then
local UserId = Text:match('(%d+)/lock_photoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Photo"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الصور").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_usernamektm') then
local UserId = Text:match('(%d+)/lock_usernamektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:User:Name"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل المعرفات").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_tagsktm') then
local UserId = Text:match('(%d+)/lock_tagsktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:hashtak"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل التاك").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_fwdktm') then
local UserId = Text:match('(%d+)/lock_fwdktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:forward"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل التوجيه").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_audioktm') then
local UserId = Text:match('(%d+)/lock_audioktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Audio"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الصوت").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_stikearktm') then
local UserId = Text:match('(%d+)/lock_stikearktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Sticker"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الملصقات").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_phonektm') then
local UserId = Text:match('(%d+)/lock_phonektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Contact"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الجهات").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_videonotektm') then
local UserId = Text:match('(%d+)/lock_videonotektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Unsupported"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل بصمه الفيديو").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_markdaunktm') then
local UserId = Text:match('(%d+)/lock_markdaunktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Markdaun"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الماركدون").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_gamesktm') then
local UserId = Text:match('(%d+)/lock_gamesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:geam"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الالعاب").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_floodktm') then
local UserId = Text:match('(%d+)/lock_floodktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(itsspider.."spider:Spam:Group:User"..ChatId ,"Spam:User","mute")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل التكرار").lockKtm, 'md', true, false, reply_markup) end end
if Text and Text:match('(%d+)/lock_linkkick') then
local UserId = Text:match('(%d+)/lock_linkkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Link"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الروابط").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_spamkick') then
local UserId = Text:match('(%d+)/lock_spamkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Spam"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الكلايش").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_keypordkick') then
local UserId = Text:match('(%d+)/lock_keypordkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Keyboard"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الكيبورد").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_voicekick') then
local UserId = Text:match('(%d+)/lock_voicekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:vico"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الاغاني").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_gifkick') then
local UserId = Text:match('(%d+)/lock_gifkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Animation"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل المتحركات").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_fileskick') then
local UserId = Text:match('(%d+)/lock_fileskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Document"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الملفات").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_videokick') then
local UserId = Text:match('(%d+)/lock_videokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Video"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الفيديو").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_photokick') then
local UserId = Text:match('(%d+)/lock_photokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Photo"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الصور").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_usernamekick') then
local UserId = Text:match('(%d+)/lock_usernamekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:User:Name"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل المعرفات").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_tagskick') then
local UserId = Text:match('(%d+)/lock_tagskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:hashtak"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل التاك").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_fwdkick') then
local UserId = Text:match('(%d+)/lock_fwdkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:forward"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل التوجيه").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_audiokick') then
local UserId = Text:match('(%d+)/lock_audiokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Audio"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الصوت").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_stikearkick') then
local UserId = Text:match('(%d+)/lock_stikearkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Sticker"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الملصقات").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_phonekick') then
local UserId = Text:match('(%d+)/lock_phonekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Contact"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الجهات").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_videonotekick') then
local UserId = Text:match('(%d+)/lock_videonotekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Unsupported"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل بصمه الفيديو").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_markdaunkick') then
local UserId = Text:match('(%d+)/lock_markdaunkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:Markdaun"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الماركدون").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_gameskick') then
local UserId = Text:match('(%d+)/lock_gameskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Lock:geam"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل الالعاب").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_floodkick') then
local UserId = Text:match('(%d+)/lock_floodkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(itsspider.."spider:Spam:Group:User"..ChatId ,"Spam:User","kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم قفل التكرار").lockKick, 'md', true, false, reply_markup) end end
if Text and Text:match('(%d+)/unmute_link') then
local UserId = Text:match('(%d+)/unmute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Status:Link"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تعطيل امر الرابط").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unmute_welcome') then
local UserId = Text:match('(%d+)/unmute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Status:Welcome"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تعطيل امر الترحيب").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unmute_Id') then
local UserId = Text:match('(%d+)/unmute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Status:Id"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تعطيل امر الايدي").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unmute_IdPhoto') then
local UserId = Text:match('(%d+)/unmute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Status:IdPhoto"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تعطيل امر الايدي بالصوره").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unmute_ryple') then
local UserId = Text:match('(%d+)/unmute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Status:Reply"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تعطيل امر ردود المدير").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unmute_ryplesudo') then
local UserId = Text:match('(%d+)/unmute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Status:ReplySudo"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تعطيل امر ردود المطور").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unmute_setadmib') then
local UserId = Text:match('(%d+)/unmute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Status:SetId"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تعطيل امر الرفع").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unmute_kickmembars') then
local UserId = Text:match('(%d+)/unmute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Status:BanId"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تعطيل امر الطرد - الحظر").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unmute_games') then
local UserId = Text:match('(%d+)/unmute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Status:Games"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تعطيل امر الالعاب").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unmute_kickme') then
local UserId = Text:match('(%d+)/unmute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Status:KickMe"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تعطيل امر اطردني").unLock, 'md', true, false, reply_markup) end end
if Text and Text:match('(%d+)/mute_link') then
local UserId = Text:match('(%d+)/mute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Status:Link"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تفعيل امر الرابط").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/mute_welcome') then
local UserId = Text:match('(%d+)/mute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Status:Welcome"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تفعيل امر الترحيب").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/mute_Id') then
local UserId = Text:match('(%d+)/mute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Status:Id"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تفعيل امر الايدي").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/mute_IdPhoto') then
local UserId = Text:match('(%d+)/mute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Status:IdPhoto"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تفعيل امر الايدي بالصوره").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/mute_ryple') then
local UserId = Text:match('(%d+)/mute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Status:Reply"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تفعيل امر ردود المدير").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/mute_ryplesudo') then
local UserId = Text:match('(%d+)/mute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Status:ReplySudo"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تفعيل امر ردود المطور").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/mute_setadmib') then
local UserId = Text:match('(%d+)/mute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Status:SetId"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تفعيل امر الرفع").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/mute_kickmembars') then
local UserId = Text:match('(%d+)/mute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Status:BanId"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تفعيل امر الطرد - الحظر").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/mute_games') then
local UserId = Text:match('(%d+)/mute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Status:Games"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تفعيل امر الالعاب").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/mute_kickme') then
local UserId = Text:match('(%d+)/mute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(itsspider.."spider:Status:KickMe"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم تفعيل امر اطردني").unLock, 'md', true, false, reply_markup) end end
if Text and Text:match('(%d+)/addAdmins@(.*)') then
local UserId = {Text:match('(%d+)/addAdmins@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
local Info_Members = LuaTele.getSupergroupMembers(UserId[2], "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele ~= "chatMemberStatusCreator" then
Redis:sadd(itsspider.."spider:Addictive:Group"..UserId[2],v.member_id.user_id) 
y = y + 1 end end
end
LuaTele.answerCallbackQuery(data.id, "⌁ : تم ترقية ‹ "..y.." › ادمنيه  ", true) end end
if Text and Text:match('(%d+)/LockAllGroup@(.*)') then
local UserId = {Text:match('(%d+)/LockAllGroup@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:set(itsspider.."spider:Lock:tagservrbot"..UserId[2],true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:set(itsspider..'spider:'..lock..UserId[2],"del")    
end
LuaTele.answerCallbackQuery(data.id, "⌁ : تم قفل جميع الاوامر بنجاح  ", true) end end
if Text and Text:match('/leftgroup@(.*)') then
local UserId = Text:match('/leftgroup@(.*)')
LuaTele.answerCallbackQuery(data.id, "⌁ : تم مغادره البوت من المجموعة", true)
LuaTele.leaveChat(UserId) end


if Text and Text:match('(%d+)/groupNumseteng//(%d+)') then
local UserId = {Text:match('(%d+)/groupNumseteng//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then return GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id) end end
if Text and Text:match('(%d+)/groupNum1//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum1//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).change_info) == 1 then
LuaTele.answerCallbackQuery(data.id, "⌁ : تم تعطيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'‹ ✗ ›',nil,nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,0, 0, 0, 0,0,0,1,0})
else
LuaTele.answerCallbackQuery(data.id, "⌁ : تم تفعيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'‹ ✓ ›',nil,nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,1, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote}) end end
end
if Text and Text:match('(%d+)/groupNum2//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum2//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).pin_messages) == 1 then
LuaTele.answerCallbackQuery(data.id, "⌁ : تم تعطيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'‹ ✗ ›',nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,0, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "⌁ : تم تفعيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'‹ ✓ ›',nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,1, GetAdminsNum(ChatId,UserId[2]).promote}) end end
end
if Text and Text:match('(%d+)/groupNum3//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum3//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).restrict_members) == 1 then
LuaTele.answerCallbackQuery(data.id, "⌁ : تم تعطيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'‹ ✗ ›',nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 0 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "⌁ : تم تفعيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'‹ ✓ ›',nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 1 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote}) end end
end
if Text and Text:match('(%d+)/groupNum4//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum4//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).invite_users) == 1 then
LuaTele.answerCallbackQuery(data.id, "⌁ : تم تعطيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'‹ ✗ ›',nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 0, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "⌁ : تم تفعيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'‹ ✓ ›',nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 1, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote}) end end
end
if Text and Text:match('(%d+)/groupNum5//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum5//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).delete_messages) == 1 then
LuaTele.answerCallbackQuery(data.id, "⌁ : تم تعطيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'‹ ✗ ›',nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 0, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "⌁ : تم تفعيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'‹ ✓ ›',nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 1, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote}) end end
end
if Text and Text:match('(%d+)/groupNum6//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum6//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).promote) == 1 then
LuaTele.answerCallbackQuery(data.id, "⌁ : تم تعطيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'‹ ✗ ›')
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 0})
else
LuaTele.answerCallbackQuery(data.id, "⌁ : تم تفعيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'‹ ✓ ›')
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 1}) end end
end
if Text and Text:match('(%d+)/web') then
local UserId = Text:match('(%d+)/web')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).web == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, false, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, true, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin) end
Get_permissions(ChatId,IdUser,Msg_id) end
elseif Text and Text:match('(%d+)/info') then
local UserId = Text:match('(%d+)/info')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).info == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, false, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, true, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin) end
Get_permissions(ChatId,IdUser,Msg_id) end
elseif Text and Text:match('(%d+)/invite') then
local UserId = Text:match('(%d+)/invite')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).invite == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, false, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, true, Getpermissions(ChatId).pin) end
Get_permissions(ChatId,IdUser,Msg_id) end
elseif Text and Text:match('(%d+)/pin') then
local UserId = Text:match('(%d+)/pin')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).pin == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, false)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, true) end
Get_permissions(ChatId,IdUser,Msg_id) end
elseif Text and Text:match('(%d+)/media') then
local UserId = Text:match('(%d+)/media')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).media == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, false, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, true, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin) end
Get_permissions(ChatId,IdUser,Msg_id) end
elseif Text and Text:match('(%d+)/messges') then
local UserId = Text:match('(%d+)/messges')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).messges == true then
LuaTele.setChatPermissions(ChatId, false, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, true, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin) end
Get_permissions(ChatId,IdUser,Msg_id) end
elseif Text and Text:match('(%d+)/other') then
local UserId = Text:match('(%d+)/other')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).other == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, false, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, true, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin) end
Get_permissions(ChatId,IdUser,Msg_id) end
elseif Text and Text:match('(%d+)/polls') then
local UserId = Text:match('(%d+)/polls')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).polls == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, false, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, true, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin) end
Get_permissions(ChatId,IdUser,Msg_id) end end
if Text and Text:match('(%d+)/listallAddorrem') then
local UserId = Text:match('(%d+)/listallAddorrem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'تعطيل الرابط', data = IdUser..'/'.. 'unmute_link'},{text = 'تفعيل الرابط', data = IdUser..'/'.. 'mute_link'},},{{text = 'تعطيل الترحيب', data = IdUser..'/'.. 'unmute_welcome'},{text = 'تفعيل الترحيب', data = IdUser..'/'.. 'mute_welcome'},},{{text = 'تعطيل الايدي', data = IdUser..'/'.. 'unmute_Id'},{text = 'تفعيل الايدي', data = IdUser..'/'.. 'mute_Id'},},{{text = 'تعطيل الايدي بالصوره', data = IdUser..'/'.. 'unmute_IdPhoto'},{text = 'تفعيل الايدي بالصوره', data = IdUser..'/'.. 'mute_IdPhoto'},},{{text = 'تعطيل ردود المدير', data = IdUser..'/'.. 'unmute_ryple'},{text = 'تفعيل ردود المدير', data = IdUser..'/'.. 'mute_ryple'},},{{text = 'تعطيل ردود المطور', data = IdUser..'/'.. 'unmute_ryplesudo'},{text = 'تفعيل ردود المطور', data = IdUser..'/'.. 'mute_ryplesudo'},},{{text = 'تعطيل الرفع', data = IdUser..'/'.. 'unmute_setadmib'},{text = 'تفعيل الرفع', data = IdUser..'/'.. 'mute_setadmib'},},{{text = 'تعطيل الطرد', data = IdUser..'/'.. 'unmute_kickmembars'},{text = 'تفعيل الطرد', data = IdUser..'/'.. 'mute_kickmembars'},},{{text = 'تعطيل الالعاب', data = IdUser..'/'.. 'unmute_games'},{text = 'تفعيل الالعاب', data = IdUser..'/'.. 'mute_games'},},{{text = 'تعطيل اطردني', data = IdUser..'/'.. 'unmute_kickme'},{text = 'تفعيل اطردني', data = IdUser..'/'.. 'mute_kickme'},},{{text = '‹ القائمه الرئيسيه ›', data = IdUser..'/helpall'},},{{text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. 'delAmr'}},}}
return LuaTele.editMessageText(ChatId,Msg_id,'⌁ : اوامر التفعيل والتعطيل الخاصة بالمجموعة ↫ ⤈', 'md', false, false, reply_markup) end end
-- OR33
if Text and Text:match('(%d+)/MMsgDel') then
local UserId = Text:match('(%d+)/MMsgDel')
if tonumber(IdUser) == tonumber(UserId) then
local MMsgDel = (Redis:get(itsspider..'spider:Num:Message:User'..data.chat_id..':'..UserId) or 0)
Redis:del(itsspider..'spider:Num:Message:User'..data.chat_id..':'..UserId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'Rgg'},},}}
LuaTele.editMessageText(ChatId,Msg_id,'*⌁ : تم مسح جميع رسائلك ↫ *‹ *'..MMsgDel..'* ›', 'md', false, false, reply_markup) end end
if Text and Text:match('(%d+)/MsgDell') then
local UserId = Text:match('(%d+)/MsgDell')
if tonumber(IdUser) == tonumber(UserId) then
local MsgDell = (Redis:get(itsspider..'spider:Num:Message:Edit'..data.chat_id..UserId) or 0)
Redis:del(itsspider..'spider:Num:Message:Edit'..data.chat_id..UserId)
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'Rgg'},},}}
LuaTele.editMessageText(ChatId,Msg_id,'*⌁ : تم مسح جميع سحكاتك ↫ *‹ *'..MsgDell..'* ›', 'md', false, false, reply_markup) end end
-- OR33
if Text and Text:match('(%d+)/NextSeting') then
local UserId = Text:match('(%d+)/NextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n⌁ : اعدادات المجموعة ".."\n⌁ : علامة ال (✓) تعني مقفول".."\n⌁ : علامة ال (✗) تعني مفتوح*"
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = GetSetieng(ChatId).lock_fwd, data = '&'},{text = 'التوجبه : ', data =IdUser..'/'.. 'Status_fwd'},},{{text = GetSetieng(ChatId).lock_muse, data = '&'},{text = 'الصوت : ', data =IdUser..'/'.. 'Status_audio'},},{{text = GetSetieng(ChatId).lock_ste, data = '&'},{text = 'الملصقات : ', data =IdUser..'/'.. 'Status_stikear'},},{{text = GetSetieng(ChatId).lock_phon, data = '&'},{text = 'الجهات : ', data =IdUser..'/'.. 'Status_phone'},},{{text = GetSetieng(ChatId).lock_join, data = '&'},{text = 'الدخول : ', data =IdUser..'/'.. 'Status_joine'},},{{text = GetSetieng(ChatId).lock_add, data = '&'},{text = 'الاضافه : ', data =IdUser..'/'.. 'Status_addmem'},},{{text = GetSetieng(ChatId).lock_self, data = '&'},{text = 'بصمه فيديو : ', data =IdUser..'/'.. 'Status_videonote'},},{{text = GetSetieng(ChatId).lock_pin, data = '&'},{text = 'التثبيت : ', data =IdUser..'/'.. 'Status_pin'},},{{text = GetSetieng(ChatId).lock_tagservr, data = '&'},{text = 'الاشعارات : ', data =IdUser..'/'.. 'Status_tgservir'},},{{text = GetSetieng(ChatId).lock_mark, data = '&'},{text = 'الماركدون : ', data =IdUser..'/'.. 'Status_markdaun'},},{{text = GetSetieng(ChatId).lock_edit, data = '&'},{text = 'التعديل : ', data =IdUser..'/'.. 'Status_edits'},},{{text = GetSetieng(ChatId).lock_geam, data = '&'},{text = 'الالعاب : ', data =IdUser..'/'.. 'Status_games'},},{{text = GetSetieng(ChatId).flood, data = '&'},{text = 'التكرار : ', data =IdUser..'/'.. 'Status_flood'},},{{text = '‹ رجوع ›', data =IdUser..'/'.. 'NoNextSeting'}},{{text = '‹ القائمه الرئيسيه ›', data = IdUser..'/helpall'},},{{text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. '/delAmr'}},}}
LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', false, false, reply_markup) end end
if Text and Text:match('(%d+)/NoNextSeting') then
local UserId = Text:match('(%d+)/NoNextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n⌁ : اعدادات المجموعة ".."\n⌁ : علامة ال (✓) تعني مقفول".."\n⌁ : علامة ال (✗) تعني مفتوح*"
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = GetSetieng(ChatId).lock_links, data = '&'},{text = 'الروابط : ', data =IdUser..'/'.. 'Status_link'},},{{text = GetSetieng(ChatId).lock_spam, data = '&'},{text = 'الكلايش : ', data =IdUser..'/'.. 'Status_spam'},},{{text = GetSetieng(ChatId).lock_inlin, data = '&'},{text = 'الكيبورد : ', data =IdUser..'/'.. 'Status_keypord'},},{{text = GetSetieng(ChatId).lock_vico, data = '&'},{text = 'الاغاني : ', data =IdUser..'/'.. 'Status_voice'},},{{text = GetSetieng(ChatId).lock_gif, data = '&'},{text = 'المتحركه : ', data =IdUser..'/'.. 'Status_gif'},},{{text = GetSetieng(ChatId).lock_file, data = '&'},{text = 'الملفات : ', data =IdUser..'/'.. 'Status_files'},},{{text = GetSetieng(ChatId).lock_text, data = '&'},{text = 'الدردشه : ', data =IdUser..'/'.. 'Status_text'},},{{text = GetSetieng(ChatId).lock_ved, data = '&'},{text = 'الفيديو : ', data =IdUser..'/'.. 'Status_video'},},{{text = GetSetieng(ChatId).lock_photo, data = '&'},{text = 'الصور : ', data =IdUser..'/'.. 'Status_photo'},},{{text = GetSetieng(ChatId).lock_user, data = '&'},{text = 'المعرفات : ', data =IdUser..'/'.. 'Status_username'},},{{text = GetSetieng(ChatId).lock_hash, data = '&'},{text = 'التاك : ', data =IdUser..'/'.. 'Status_tags'},},{{text = GetSetieng(ChatId).lock_bots, data = '&'},{text = 'البوتات : ', data =IdUser..'/'.. 'Status_bots'},},{{text = 'التالي', data =IdUser..'/'.. 'NextSeting'}},{{text = '‹ القائمه الرئيسيه ›', data = IdUser..'/helpall'},},{{text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. 'delAmr'}},}}
LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', false, false, reply_markup) end end 
-- OR33
if Text and Text:match('(%d+)/TheBasicsOR33') then
local UserId = Text:match('(%d+)/TheBasicsOR33')
if tonumber(IdUser) == tonumber(UserId) then 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoAOR33'},},}}
local Info_Members = Redis:smembers(itsspider.."spider:TheBasics:Group"..data.chat_id) 
if #Info_Members == 0 then return LuaTele.editMessageText(ChatId,Msg_id,"⌁ : لا يوجد منشئين اساسيين حالياً , ","md",true, false, reply_markup)  end
ListMembers = '\n*⌁ : قائمة المنشئين الاساسيين في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
return LuaTele.editMessageText(ChatId,Msg_id,ListMembers,"md", true, false, reply_markup) end end
--
if Text and Text:match('(%d+)/OriginatorsOR33') then
local UserId = Text:match('(%d+)/OriginatorsOR33')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoAOR33'},},}}
local Info_Members = Redis:smembers(itsspider.."spider:Originators:Group"..data.chat_id) 
if #Info_Members == 0 then return LuaTele.editMessageText(ChatId,Msg_id,"⌁ : لا يوجد منشئين حالياً , ","md",true, false, reply_markup) end
ListMembers = '\n*⌁ : قائمة منشئين في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
return LuaTele.editMessageText(ChatId,Msg_id,ListMembers,"md",true, false, reply_markup) end end
--
if Text and Text:match('(%d+)/ManagersOR33') then
local UserId = Text:match('(%d+)/ManagersOR33')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoAOR33'},},}}
local Info_Members = Redis:smembers(itsspider.."spider:Managers:Group"..data.chat_id) 
if #Info_Members == 0 then return LuaTele.editMessageText(ChatId,Msg_id,"⌁ : لا يوجد مدراء حالياً , ","md",true, false, reply_markup) end
ListMembers = '\n*⌁ : قائمة مدراء في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
return LuaTele.editMessageText(ChatId,Msg_id,ListMembers,"md",true, false, reply_markup) end end
--
if Text and Text:match('(%d+)/AddictiveOR33') then
local UserId = Text:match('(%d+)/AddictiveOR33')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoAOR33'},},}}
local Info_Members = Redis:smembers(itsspider.."spider:Addictive:Group"..data.chat_id) 
if #Info_Members == 0 then return LuaTele.editMessageText(ChatId,Msg_id,"⌁ : لا يوجد ادمنيه حالياً , ","md",true, false, reply_markup) end
ListMembers = '\n*⌁ : قائمة الادمنية في بالمجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
return LuaTele.editMessageText(ChatId,Msg_id,ListMembers,"md",true, false, reply_markup) end end
--
if Text and Text:match('(%d+)/DelDistinguishedOR33') then
local UserId = Text:match('(%d+)/DelDistinguishedOR33')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoAOR33'},},}}
local Info_Members = Redis:smembers(itsspider.."spider:Distinguished:Group"..data.chat_id) 
if #Info_Members == 0 then return LuaTele.editMessageText(ChatId,Msg_id,"⌁ : لا يوجد مميزين حالياً , ","md",true, false, reply_markup) end
ListMembers = '\n*⌁ : قائمة المميزين في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
return LuaTele.editMessageText(ChatId,Msg_id,ListMembers,"md",true, false, reply_markup) end end
--
if Text and Text:match('(%d+)/RgoAOR33') then
local UserId = Text:match('(%d+)/RgoAOR33')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n⌁ : هلا بك في قسم رتب المجموعة*"
local L = Redis:scard(itsspider.."spider:TheBasics:Group"..data.chat_id) 
local LL = Redis:scard(itsspider.."spider:Originators:Group"..data.chat_id) 
local LLL = Redis:scard(itsspider.."spider:Managers:Group"..data.chat_id)
local LLLL = Redis:scard(itsspider.."spider:Addictive:Group"..data.chat_id)  
local LLLLL = Redis:scard(itsspider.."spider:Distinguished:Group"..data.chat_id)
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الاساسيين : '..L..' ›', data =IdUser..'/'.. 'TheBasicsOR33'},},{{text = '‹ المنشئين : '..LL..' ›', data =IdUser..'/'.. 'OriginatorsOR33'},{text = '‹ المدراء : '..LLL..' ›', data =IdUser..'/'.. 'ManagersOR33'},},{{text = '‹ الادمنيه : '..LLLL..' ›', data =IdUser..'/'.. 'AddictiveOR33'},{text = '‹ المميزين : '..LLLLL..' ›', data =IdUser..'/'.. 'DelDistinguishedOR33'},},{{text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. 'delAmr'}},}}
return LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', true, false, reply_markup) end end 
--
if Text and Text:match('(%d+)/RgoA') then
local UserId = Text:match('(%d+)/RgoA')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n⌁ : هلا بك في قسم رتب المجموعة*"
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح الاساسين ›', data =IdUser..'/'.. 'TheBasics'},},{{text = '‹ مسح المنشئين ›', data =IdUser..'/'.. 'Originators'},{text = '‹ مسح المدراء ›', data =IdUser..'/'.. 'Managers'},},{{text = '‹ مسح الادمنيه ›', data =IdUser..'/'.. 'Addictive'},{text = '‹ مسح المميزين ›', data =IdUser..'/'.. 'DelDistinguished'},},{{text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. 'delAmr'}},}}
LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', false, false, reply_markup) end end 
-- OR33
if Text and Text:match('(%d+)/Rgg') then
local UserId = Text:match('(%d+)/Rgg')
if tonumber(IdUser) == tonumber(UserId) then
local OR33 = (Redis:get(itsspider..'spider:Num:Message:Edit'..data.chat_id..UserId) or 0)
local OR33 = (Redis:get(itsspider..'spider:Num:Message:User'..data.chat_id..':'..UserId) or 0)
local Text = "\n⌁ : من خلال الازرار يمكنك مسح رسائلك وسحكاتك"
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح سحكاتي : '..OR33..' ›', data =IdUser..'/'.. 'MsgDell'},{text = '‹ مسح رسائلي : '..OR33..' ›', data =IdUser..'/'.. 'MMsgDel'},},{{text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. 'delAmr'}},{{text = '‹ Sourec F᥆Ꭱx ›', url = 't.me/wwttw'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', false, false, reply_markup) end end 
-- OR33
if Text and Text:match('(%d+)/delAmr') then
local UserId = Text:match('(%d+)/delAmr')
if tonumber(IdUser) == tonumber(UserId) then return LuaTele.deleteMessages(ChatId,{[1]= Msg_id}) end end
if Text and Text:match('(%d+)/Status_link') then
local UserId = Text:match('(%d+)/Status_link')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الروابط', data =UserId..'/'.. 'lock_link'},{text = 'قفل الروابط بالكتم', data =UserId..'/'.. 'lock_linkktm'},},{{text = 'قفل الروابط بالطرد', data =UserId..'/'.. 'lock_linkkick'},{text = 'قفل الروابط بالتقييد', data =UserId..'/'.. 'lock_linkkid'},},{{text = 'فتح الروابط', data =UserId..'/'.. 'unlock_link'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر الروابط", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_spam') then
local UserId = Text:match('(%d+)/Status_spam')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الكلايش', data =UserId..'/'.. 'lock_spam'},{text = 'قفل الكلايش بالكتم', data =UserId..'/'.. 'lock_spamktm'},},{{text = 'قفل الكلايش بالطرد', data =UserId..'/'.. 'lock_spamkick'},{text = 'قفل الكلايش بالتقييد', data =UserId..'/'.. 'lock_spamid'},},{{text = 'فتح الكلايش', data =UserId..'/'.. 'unlock_spam'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر الكلايش", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_keypord') then
local UserId = Text:match('(%d+)/Status_keypord')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الكيبورد', data =UserId..'/'.. 'lock_keypord'},{text = 'قفل الكيبورد بالكتم', data =UserId..'/'.. 'lock_keypordktm'},},{{text = 'قفل الكيبورد بالطرد', data =UserId..'/'.. 'lock_keypordkick'},{text = 'قفل الكيبورد بالتقييد', data =UserId..'/'.. 'lock_keypordkid'},},{{text = 'فتح الكيبورد', data =UserId..'/'.. 'unlock_keypord'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر الكيبورد", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_voice') then
local UserId = Text:match('(%d+)/Status_voice')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الاغاني', data =UserId..'/'.. 'lock_voice'},{text = 'قفل الاغاني بالكتم', data =UserId..'/'.. 'lock_voicektm'},},{{text = 'قفل الاغاني بالطرد', data =UserId..'/'.. 'lock_voicekick'},{text = 'قفل الاغاني بالتقييد', data =UserId..'/'.. 'lock_voicekid'},},{{text = 'فتح الاغاني', data =UserId..'/'.. 'unlock_voice'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر الاغاني", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_gif') then
local UserId = Text:match('(%d+)/Status_gif')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل المتحركه', data =UserId..'/'.. 'lock_gif'},{text = 'قفل المتحركه بالكتم', data =UserId..'/'.. 'lock_gifktm'},},{{text = 'قفل المتحركه بالطرد', data =UserId..'/'.. 'lock_gifkick'},{text = 'قفل المتحركه بالتقييد', data =UserId..'/'.. 'lock_gifkid'},},{{text = 'فتح المتحركه', data =UserId..'/'.. 'unlock_gif'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر المتحركات", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_files') then
local UserId = Text:match('(%d+)/Status_files')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الملفات', data =UserId..'/'.. 'lock_files'},{text = 'قفل الملفات بالكتم', data =UserId..'/'.. 'lock_filesktm'},},{{text = 'قفل النلفات بالطرد', data =UserId..'/'.. 'lock_fileskick'},{text = 'قفل الملقات بالتقييد', data =UserId..'/'.. 'lock_fileskid'},},{{text = 'فتح الملقات', data =UserId..'/'.. 'unlock_files'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر الملفات", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_text') then
local UserId = Text:match('(%d+)/Status_text')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الدردشه', data =UserId..'/'.. 'lock_text'},},{{text = 'فتح الدردشه', data =UserId..'/'.. 'unlock_text'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر الدردشه", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_video') then
local UserId = Text:match('(%d+)/Status_video')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الفيديو', data =UserId..'/'.. 'lock_video'},{text = 'قفل الفيديو بالكتم', data =UserId..'/'.. 'lock_videoktm'},},{{text = 'قفل الفيديو بالطرد', data =UserId..'/'.. 'lock_videokick'},{text = 'قفل الفيديو بالتقييد', data =UserId..'/'.. 'lock_videokid'},},{{text = 'فتح الفيديو', data =UserId..'/'.. 'unlock_video'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر الفيديو", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_photo') then
local UserId = Text:match('(%d+)/Status_photo')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الصور', data =UserId..'/'.. 'lock_photo'},{text = 'قفل الصور بالكتم', data =UserId..'/'.. 'lock_photoktm'},},{{text = 'قفل الصور بالطرد', data =UserId..'/'.. 'lock_photokick'},{text = 'قفل الصور بالتقييد', data =UserId..'/'.. 'lock_photokid'},},{{text = 'فتح الصور', data =UserId..'/'.. 'unlock_photo'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر الصور", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_username') then
local UserId = Text:match('(%d+)/Status_username')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل المعرفات', data =UserId..'/'.. 'lock_username'},{text = 'قفل المعرفات بالكتم', data =UserId..'/'.. 'lock_usernamektm'},},{{text = 'قفل المعرفات بالطرد', data =UserId..'/'.. 'lock_usernamekick'},{text = 'قفل المعرفات بالتقييد', data =UserId..'/'.. 'lock_usernamekid'},},{{text = 'فتح المعرفات', data =UserId..'/'.. 'unlock_username'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر المعرفات", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_tags') then
local UserId = Text:match('(%d+)/Status_tags')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل التاك', data =UserId..'/'.. 'lock_tags'},{text = 'قفل التاك بالكتم', data =UserId..'/'.. 'lock_tagsktm'},},{{text = 'قفل التاك بالطرد', data =UserId..'/'.. 'lock_tagskick'},{text = 'قفل التاك بالتقييد', data =UserId..'/'.. 'lock_tagskid'},},{{text = 'فتح التاك', data =UserId..'/'.. 'unlock_tags'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر التاك", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_bots') then
local UserId = Text:match('(%d+)/Status_bots')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل البوتات', data =UserId..'/'.. 'lock_bots'},{text = 'قفل البوتات بالطرد', data =UserId..'/'.. 'lock_botskick'},},{{text = 'فتح البوتات', data =UserId..'/'.. 'unlock_bots'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر البوتات", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_fwd') then
local UserId = Text:match('(%d+)/Status_fwd')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل التوجيه', data =UserId..'/'.. 'lock_fwd'},{text = 'قفل التوجيه بالكتم', data =UserId..'/'.. 'lock_fwdktm'},},{{text = 'قفل التوجيه بالطرد', data =UserId..'/'.. 'lock_fwdkick'},{text = 'قفل التوجيه بالتقييد', data =UserId..'/'.. 'lock_fwdkid'},},{{text = 'فتح التوجيه', data =UserId..'/'.. 'unlock_link'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر التوجيه", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_audio') then
local UserId = Text:match('(%d+)/Status_audio')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الصوت', data =UserId..'/'.. 'lock_audio'},{text = 'قفل الصوت بالكتم', data =UserId..'/'.. 'lock_audioktm'},},{{text = 'قفل الصوت بالطرد', data =UserId..'/'.. 'lock_audiokick'},{text = 'قفل الصوت بالتقييد', data =UserId..'/'.. 'lock_audiokid'},},{{text = 'فتح الصوت', data =UserId..'/'.. 'unlock_audio'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر الصوت", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_stikear') then
local UserId = Text:match('(%d+)/Status_stikear')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الملصقات', data =UserId..'/'.. 'lock_stikear'},{text = 'قفل الملصقات بالكتم', data =UserId..'/'.. 'lock_stikearktm'},},{{text = 'قفل الملصقات بالطرد', data =UserId..'/'.. 'lock_stikearkick'},{text = 'قفل الملصقات بالتقييد', data =UserId..'/'.. 'lock_stikearkid'},},{{text = 'فتح الملصقات', data =UserId..'/'.. 'unlock_stikear'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر الملصقات", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_phone') then
local UserId = Text:match('(%d+)/Status_phone')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الجهات', data =UserId..'/'.. 'lock_phone'},{text = 'قفل الجهات بالكتم', data =UserId..'/'.. 'lock_phonektm'},},{{text = 'قفل الجهات بالطرد', data =UserId..'/'.. 'lock_phonekick'},{text = 'قفل الجهات بالتقييد', data =UserId..'/'.. 'lock_phonekid'},},{{text = 'فتح الجهات', data =UserId..'/'.. 'unlock_phone'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر الجهات", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_joine') then
local UserId = Text:match('(%d+)/Status_joine')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الدخول', data =UserId..'/'.. 'lock_joine'},},{{text = 'فتح الدخول', data =UserId..'/'.. 'unlock_joine'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر الدخول", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_addmem') then
local UserId = Text:match('(%d+)/Status_addmem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الاضافه', data =UserId..'/'.. 'lock_addmem'},},{{text = 'فتح الاضافه', data =UserId..'/'.. 'unlock_addmem'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر الاضافه", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_videonote') then
local UserId = Text:match('(%d+)/Status_videonote')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل السيلفي', data =UserId..'/'.. 'lock_videonote'},{text = 'قفل السيلفي بالكتم', data =UserId..'/'.. 'lock_videonotektm'},},{{text = 'قفل السيلفي بالطرد', data =UserId..'/'.. 'lock_videonotekick'},{text = 'قفل السيلفي بالتقييد', data =UserId..'/'.. 'lock_videonotekid'},},{{text = 'فتح السيلفي', data =UserId..'/'.. 'unlock_videonote'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر بصمه الفيديو", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_pin') then
local UserId = Text:match('(%d+)/Status_pin')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل التثبيت', data =UserId..'/'.. 'lock_pin'},},{{text = 'فتح التثبيت', data =UserId..'/'.. 'unlock_pin'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر التثبيت", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_tgservir') then
local UserId = Text:match('(%d+)/Status_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الاشعارات', data =UserId..'/'.. 'lock_tgservir'},},{{text = 'فتح الاشعارات', data =UserId..'/'.. 'unlock_tgservir'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر الاشعارات", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_markdaun') then
local UserId = Text:match('(%d+)/Status_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الماركداون', data =UserId..'/'.. 'lock_markdaun'},{text = 'قفل الماركداون بالكتم', data =UserId..'/'.. 'lock_markdaunktm'},},{{text = 'قفل الماركداون بالطرد', data =UserId..'/'.. 'lock_markdaunkick'},{text = 'قفل الماركداون بالتقييد', data =UserId..'/'.. 'lock_markdaunkid'},},{{text = 'فتح الماركداون', data =UserId..'/'.. 'unlock_markdaun'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر الماركدون", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_edits') then
local UserId = Text:match('(%d+)/Status_edits')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل التعديل', data =UserId..'/'.. 'lock_edits'},},{{text = 'فتح التعديل', data =UserId..'/'.. 'unlock_edits'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر التعديل", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_games') then
local UserId = Text:match('(%d+)/Status_games')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الالعاب', data =UserId..'/'.. 'lock_games'},{text = 'قفل الالعاب بالكتم', data =UserId..'/'.. 'lock_gamesktm'},},{{text = 'قفل الالعاب بالطرد', data =UserId..'/'.. 'lock_gameskick'},{text = 'قفل الالعاب بالتقييد', data =UserId..'/'.. 'lock_gameskid'},},{{text = 'فتح الالعاب', data =UserId..'/'.. 'unlock_games'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر الالعاب", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_flood') then
local UserId = Text:match('(%d+)/Status_flood')
if tonumber(IdUser) == tonumber(UserId) then

local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل التكرار', data =UserId..'/'.. 'lock_flood'},{text = 'قفل التكرار بالكتم', data =UserId..'/'.. 'lock_floodktm'},},{{text = 'قفل التكرار بالطرد', data =UserId..'/'.. 'lock_floodkick'},{text = 'قفل التكرار بالتقييد', data =UserId..'/'.. 'lock_floodkid'},},{{text = 'فتح التكرار', data =UserId..'/'.. 'unlock_flood'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : عليك اختيار نوع القفل او الفتح على امر التكرار", 'md', true, false, reply_markup) end



elseif Text and Text:match('(%d+)/unlock_link') then
local UserId = Text:match('(%d+)/unlock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:Link"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح الروابط").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_spam') then
local UserId = Text:match('(%d+)/unlock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:Spam"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح الكلايش").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_keypord') then
local UserId = Text:match('(%d+)/unlock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:Keyboard"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح الكيبورد").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_voice') then
local UserId = Text:match('(%d+)/unlock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:vico"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح الاغاني").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_gif') then
local UserId = Text:match('(%d+)/unlock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:Animation"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح المتحركات").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_files') then
local UserId = Text:match('(%d+)/unlock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:Document"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح الملفات").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_text') then
local UserId = Text:match('(%d+)/unlock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:text"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح الدردشه").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_video') then
local UserId = Text:match('(%d+)/unlock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:Video"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح الفيديو").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_photo') then
local UserId = Text:match('(%d+)/unlock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:Photo"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح الصور").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_username') then
local UserId = Text:match('(%d+)/unlock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:User:Name"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح المعرفات").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_tags') then
local UserId = Text:match('(%d+)/unlock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:hashtak"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح التاك").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_bots') then
local UserId = Text:match('(%d+)/unlock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:Bot:kick"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح البوتات").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_fwd') then
local UserId = Text:match('(%d+)/unlock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:forward"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح التوجيه").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_audio') then
local UserId = Text:match('(%d+)/unlock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:Audio"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح الصوت").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_stikear') then
local UserId = Text:match('(%d+)/unlock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:Sticker"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح الملصقات").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_phone') then
local UserId = Text:match('(%d+)/unlock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:Contact"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح الجهات").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_joine') then
local UserId = Text:match('(%d+)/unlock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:Join"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح الدخول").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_addmem') then
local UserId = Text:match('(%d+)/unlock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:AddMempar"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح الاضافه").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_videonote') then
local UserId = Text:match('(%d+)/unlock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:Unsupported"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح بصمه الفيديو").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_pin') then
local UserId = Text:match('(%d+)/unlock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:lockpin"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح التثبيت").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_tgservir') then
local UserId = Text:match('(%d+)/unlock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:tagservr"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح الاشعارات").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_markdaun') then
local UserId = Text:match('(%d+)/unlock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:Markdaun"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح الماركدون").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_edits') then
local UserId = Text:match('(%d+)/unlock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:edit"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح التعديل").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_games') then
local UserId = Text:match('(%d+)/unlock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Lock:geam"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح الالعاب").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_flood') then
local UserId = Text:match('(%d+)/unlock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hdel(itsspider.."spider:Spam:Group:User"..ChatId ,"Spam:User")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"⌁ : تم فتح التكرار").unLock, 'md', true, false, reply_markup) end end
if Text and Text:match('(%d+)/Developers') then
local UserId = Text:match('(%d+)/Developers')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Developers:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : تم مسح مطورين البوت", 'md', false) end
elseif Text and Text:match('(%d+)/DevelopersAS') then
local UserId = Text:match('(%d+)/DevelopersAS')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:DevelopersAS:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : تم مسح المطورين الاساسيين", 'md', false) end
elseif Text and Text:match('(%d+)/DevelopersQ') then
local UserId = Text:match('(%d+)/DevelopersQ')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:DevelopersQ:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : تم مسح المطورين الثانويين", 'md', false) end
elseif Text and Text:match('(%d+)/TheBasicsQ') then
local UserId = Text:match('(%d+)/TheBasicsQ')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:TheBasicsQ:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoA'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"*⌁ : تم مسح المالكين بالمجموعة *", 'md', false, false, reply_markup) end
elseif Text and Text:match('(%d+)/TheBasics') then
local UserId = Text:match('(%d+)/TheBasics')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:TheBasics:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoA'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : تم مسح المنشئين الاساسيين", 'md', false, false, reply_markup) end
elseif Text and Text:match('(%d+)/Originators') then
local UserId = Text:match('(%d+)/Originators')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Originators:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoA'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : تم مسح المنشئين بالمجموعة", 'md', false, false, reply_markup) end
elseif Text and Text:match('(%d+)/Managers') then
local UserId = Text:match('(%d+)/Managers')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Managers:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoA'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : تم مسح المدراء بالمجموعة", 'md', false, false, reply_markup) end
elseif Text and Text:match('(%d+)/Addictive') then
local UserId = Text:match('(%d+)/Addictive')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Addictive:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoA'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : تم مسح ادمنيه المجموعة", 'md', false, false, reply_markup) end
elseif Text and Text:match('(%d+)/DelDistinguished') then
local UserId = Text:match('(%d+)/DelDistinguished')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Distinguished:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoA'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : تم مسح المميزين بالمجموعة", 'md', false, false, reply_markup) end
elseif Text and Text:match('(%d+)/Cleaner') then
local UserId = Text:match('(%d+)/Cleaner')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:Cleaner:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : تم مسح المنظفين بالمجموعة", 'md', false) end
elseif Text and Text:match('(%d+)/BanAll') then
local UserId = Text:match('(%d+)/BanAll')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:BanAll:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : تم مسح المحظورين عام", 'md', false) end
elseif Text and Text:match('(%d+)/ktmAll') then
local UserId = Text:match('(%d+)/ktmAll')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:ktmAll:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : تم مسح المكتومين عام", 'md', false) end
elseif Text and Text:match('(%d+)/BanGroup') then
local UserId = Text:match('(%d+)/BanGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:BanGroup:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : تم مسح المحظورين بالمجموعة", 'md', false) end
elseif Text and Text:match('(%d+)/SilentGroupGroup') then
local UserId = Text:match('(%d+)/SilentGroupGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(itsspider.."spider:SilentGroup:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"⌁ : تم مسح المكتومين بالمجموعة", 'md', false) end end
 end end


luatele.run(CallBackLua)
 





