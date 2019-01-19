function varargout = Selection(varargin)
% SELECTION MATLAB code for Selection.fig
%      SELECTION, by itself, creates a new SELECTION or raises the existing
%      singleton*.
%
%      H = SELECTION returns the handle to a new SELECTION or the handle to
%      the existing singleton*.
%
%      SELECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECTION.M with the given input arguments.
%
%      SELECTION('Property','Value',...) creates a new SELECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Selection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Selection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Selection

% Last Modified by GUIDE v2.5 16-Jan-2019 19:19:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Selection_OpeningFcn, ...
                   'gui_OutputFcn',  @Selection_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

% End initialization code - DO NOT EDIT


% --- Executes just before Selection is made visible.
function Selection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Selection (see VARARGIN)

% Choose default command line output for Selection
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui(gcf,'center');
% UIWAIT makes Selection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Selection_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;
axes(handles.axes1)
matlabImage = imread('LBB.jpg');
image(matlabImage)
axis off
axis image
guidata(hObject, handles);
x=1;
global besten;
besten=[];
if x==1
    set(handles.uipanel3,'visible','off');
    set(handles.uipanel7,'visible','off');
    set(handles.uipanel8,'visible','off');
    set(handles.uipanel11,'visible','off');
    set(handles.uipanel12,'visible','off');
    set(handles.uipanel13,'visible','off');
    set(handles.uipanel14,'visible','off');
    set(handles.uipanel15,'visible','off');
    set(handles.uipanel17,'visible','off');
    set(handles.uipanel18,'visible','off');
    set(handles.uipanel19,'visible','off');
    set(handles.uipanel21,'visible','off');
    set(handles.uipanel22,'visible','off');
    set(handles.uipanel30,'visible','off');
    set(handles.uipanel29,'visible','off');
    set(handles.uipanel23,'visible','on');
end
set(handles.popupmenu1,'value',13);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fn pn] = uigetfile({'*.txt;*.mat;*.xls;*.xlsx', 'DNA Sequence (*.mat, *.txt,*.xls,*.xlsx)'},'Select Input File');
complete = strcat(pn,fn);
set(handles.edit1,'string','data.txt');
in=importdata(complete);
[a,b]=size(in);
str=get(handles.edit1,'string');
for i=1:a
    f1=randi(a);
    f2=randi(a);
    t=in(f1,:);
    in(f1,:)=in(f2,:);
    in(f2,:)=t;
end
if exist('normalizedinput.txt', 'file')==2
  delete('normalizedinput.txt');
end
dlmwrite('data.txt',in);
set(handles.edit2,'string',num2str(b));
set(handles.edit63,'string',num2str(b-2));
set(handles.edit83,'string',num2str(round((b-2)/2)));


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
global pwcc;
global pcwcc;
global hamwcc;
global hamawcc;
global hamcwcc;
global hamcawcc;
global wccf;
global wccc;
global wcct;
global enum;
tic;
str1='Please wait ...';
str2='WCC is running';
str1=cellstr(str1);
str2=cellstr(str2);
sstr=['Execution number is : ',num2str(enum)];
st=[sstr;str2;str1];
set(handles.listbox1,'string',st);
pause(1);
tp=get(handles.edit10,'string');
tp=str2num(tp);
tp=tp/100;
sv=get(handles.edit9,'string');
nteam= str2num(get(handles.edit3,'string'));
loadedfile=get(handles.edit1,'string');
input=importdata(loadedfile);
labelc=str2num(get(handles.edit2,'string'));
val=get(handles.checkbox23,'value');
if val==1
   input(1,:)=[];
end
val=get(handles.checkbox24,'value');
if val==1
   input(:,1)=[];
end
[m,n]=size(input);
n=n-1;
col=str2num(get(handles.edit63,'string'));
nos=str2num(get(handles.edit8,'string'));
teams=zeros(nteam,col+3);
mtime=str2num(get(handles.edit6,'string'));
teams=initial(teams,n);
nog=str2num(get(handles.edit4,'string'));
label=input(:,labelc);
input(:,labelc)=[];
hamwcc=[];
hamcwcc=[];
hamawcc=[];
hamcawcc=[];
teams=score(teams,input,label,tp,sv);
for g=1:nos
   teams=grouping(teams,nog,nteam); 
   teams=groupmatch(teams,mtime,input,label,tp,sv,n);
   [f1,f2]=selectminmax(teams);
   hamwcc=[hamwcc,f1];
   hamcwcc=[hamcwcc,f2];
   hamawcc=[hamawcc,mean(teams(:,col+2))];
   hamcawcc=[hamcawcc,mean(teams(:,col+3))];
end
teams=eliminate(teams,mtime,input,label,tp,sv,n);
global fwcc;
fwcc=[fwcc;teams];
[a,b]=size(hamwcc);
[f1,f2]=selectminmax(teams);
hamwcc(a,b)=f1;
hamcwcc(a,b)=f2;
st='The value of RMSEis: ';
st=strcat(st,num2str(teams(1,col+2)));
set(handles.listbox1, 'String',st);
st = cellstr(get(handles.listbox1,'string'));
st2='The elapsed time of WCC based on seconds is :  ';
st2=strcat(st2,num2str(toc));
wcct=[wcct;cellstr(num2str(toc))];
st3='The value of R^2 is :  ';
st3=strcat(st3,num2str(teams(1,col+3)));
features='';
cou=0;
for i=1:col
    flag=1;
    for j=1:i-1
        if teams(1,i)==teams(1,j)
            flag=0;
            break;
        end
    end 
    if flag==1  
       cou=cou+1;
       features=strcat(features,',',num2str(teams(1,i))); 
    end
end
[a,b]=size(features);
features=features(a,2:b);
features=cellstr(features);
wccf=[wccf;features];
wccc=[wccc;cellstr(num2str(cou))];
global wcck;
wcck=[wcck;cou];
x=get(handles.checkbox25,'value');
if x==1
   pwcc=[pwcc,teams(1,col+2)];
else
   pwcc=[pwcc,teams(1,col+2)]; 
end
pcwcc=[pcwcc,teams(1,col+3)];
st4='Number of selected fetures :';
st4=strcat(st4,num2str(cou));
ne = [st;st3;st2;features;st4];
set(handles.listbox1,'String',ne);




function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=get(handles.popupmenu1,'value');
if x==1
    set(handles.uipanel3,'visible','on');
    set(handles.uipanel7,'visible','off');
    set(handles.uipanel8,'visible','off');
    set(handles.uipanel11,'visible','off');
    set(handles.uipanel12,'visible','off');
    set(handles.uipanel13,'visible','off');
    set(handles.uipanel14,'visible','off');
    set(handles.uipanel15,'visible','off');
    set(handles.uipanel17,'visible','off');
    set(handles.uipanel18,'visible','off');
    set(handles.uipanel19,'visible','off');
    set(handles.uipanel21,'visible','off');
    set(handles.uipanel22,'visible','off');
    set(handles.uipanel23,'visible','off');
end
if x==2
    set(handles.uipanel3,'visible','off');
    set(handles.uipanel7,'visible','off');
    set(handles.uipanel8,'visible','off');
    set(handles.uipanel11,'visible','on');
    set(handles.uipanel12,'visible','off');
    set(handles.uipanel13,'visible','off');
    set(handles.uipanel14,'visible','off');
    set(handles.uipanel15,'visible','off');
    set(handles.uipanel17,'visible','off');
    set(handles.uipanel18,'visible','off');
    set(handles.uipanel19,'visible','off');
    set(handles.uipanel21,'visible','off');
    set(handles.uipanel22,'visible','off');
    set(handles.uipanel23,'visible','off');
end
if x==3
    set(handles.uipanel3,'visible','off');
    set(handles.uipanel7,'visible','off');
    set(handles.uipanel8,'visible','off');
    set(handles.uipanel11,'visible','off');
    set(handles.uipanel12,'visible','on');
    set(handles.uipanel13,'visible','off');
    set(handles.uipanel14,'visible','off');
    set(handles.uipanel15,'visible','off');
    set(handles.uipanel17,'visible','off');
    set(handles.uipanel18,'visible','off');
    set(handles.uipanel19,'visible','off');
    set(handles.uipanel21,'visible','off');
    set(handles.uipanel22,'visible','off');
    set(handles.uipanel23,'visible','off');
end
if x==4
    set(handles.uipanel3,'visible','off');
    set(handles.uipanel8,'visible','on');
    set(handles.uipanel7,'visible','off');
    set(handles.uipanel11,'visible','off');
    set(handles.uipanel12,'visible','off');
    set(handles.uipanel13,'visible','off');
    set(handles.uipanel14,'visible','off');
    set(handles.uipanel15,'visible','off');
    set(handles.uipanel17,'visible','off');
    set(handles.uipanel18,'visible','off');
    set(handles.uipanel19,'visible','off');
    set(handles.uipanel21,'visible','off');
    set(handles.uipanel22,'visible','off');
    set(handles.uipanel23,'visible','off');
end
if x==5
    set(handles.uipanel3,'visible','off');
    set(handles.uipanel8,'visible','off');
    set(handles.uipanel7,'visible','on');
    set(handles.uipanel11,'visible','off');
    set(handles.uipanel12,'visible','off');
    set(handles.uipanel13,'visible','off');
    set(handles.uipanel14,'visible','off');
    set(handles.uipanel15,'visible','off');
    set(handles.uipanel17,'visible','off');
    set(handles.uipanel18,'visible','off');
    set(handles.uipanel19,'visible','off');
    set(handles.uipanel21,'visible','off');
    set(handles.uipanel22,'visible','off');
    set(handles.uipanel23,'visible','off');
end
if x==6
    set(handles.uipanel3,'visible','off');
    set(handles.uipanel8,'visible','off');
    set(handles.uipanel7,'visible','off');
    set(handles.uipanel11,'visible','off');
    set(handles.uipanel12,'visible','off');
    set(handles.uipanel13,'visible','on');
    set(handles.uipanel14,'visible','off');
    set(handles.uipanel15,'visible','off');
    set(handles.uipanel17,'visible','off');
    set(handles.uipanel18,'visible','off');
    set(handles.uipanel19,'visible','off');
    set(handles.uipanel21,'visible','off');
    set(handles.uipanel22,'visible','off');
    set(handles.uipanel23,'visible','off');
end
if x==7
    set(handles.uipanel3,'visible','off');
    set(handles.uipanel8,'visible','off');
    set(handles.uipanel7,'visible','off');
    set(handles.uipanel11,'visible','off');
    set(handles.uipanel12,'visible','off');
    set(handles.uipanel13,'visible','off');
    set(handles.uipanel14,'visible','off');
    set(handles.uipanel15,'visible','on');
    set(handles.uipanel17,'visible','off');
    set(handles.uipanel18,'visible','off');
    set(handles.uipanel19,'visible','off');
    set(handles.uipanel21,'visible','off');
    set(handles.uipanel22,'visible','off');
    set(handles.uipanel23,'visible','off');
end
if x==8
    set(handles.uipanel3,'visible','off');
    set(handles.uipanel8,'visible','off');
    set(handles.uipanel7,'visible','off');
    set(handles.uipanel11,'visible','off');
    set(handles.uipanel12,'visible','off');
    set(handles.uipanel13,'visible','off');
    set(handles.uipanel14,'visible','off');
    set(handles.uipanel15,'visible','off');
    set(handles.uipanel17,'visible','off');
    set(handles.uipanel18,'visible','on');
    set(handles.uipanel19,'visible','off');
    set(handles.uipanel21,'visible','off');
    set(handles.uipanel22,'visible','off');
    set(handles.uipanel23,'visible','off');
end
if x==9
    set(handles.uipanel3,'visible','off');
    set(handles.uipanel8,'visible','off');
    set(handles.uipanel7,'visible','off');
    set(handles.uipanel11,'visible','off');
    set(handles.uipanel12,'visible','off');
    set(handles.uipanel13,'visible','off');
    set(handles.uipanel14,'visible','off');
    set(handles.uipanel15,'visible','off');
    set(handles.uipanel17,'visible','on');
    set(handles.uipanel18,'visible','off');
    set(handles.uipanel19,'visible','off');
    set(handles.uipanel21,'visible','off');
    set(handles.uipanel22,'visible','off');
    set(handles.uipanel23,'visible','off');
end
if x==10
    set(handles.uipanel3,'visible','off');
    set(handles.uipanel8,'visible','off');
    set(handles.uipanel7,'visible','off');
    set(handles.uipanel11,'visible','off');
    set(handles.uipanel12,'visible','off');
    set(handles.uipanel13,'visible','off');
    set(handles.uipanel14,'visible','on');
    set(handles.uipanel15,'visible','off');
    set(handles.uipanel17,'visible','off');
    set(handles.uipanel18,'visible','off');
    set(handles.uipanel19,'visible','off');
    set(handles.uipanel21,'visible','off');
    set(handles.uipanel22,'visible','off');
    set(handles.uipanel23,'visible','off');
end
if x==11
    set(handles.uipanel3,'visible','off');
    set(handles.uipanel8,'visible','off');
    set(handles.uipanel7,'visible','off');
    set(handles.uipanel11,'visible','off');
    set(handles.uipanel12,'visible','off');
    set(handles.uipanel13,'visible','off');
    set(handles.uipanel14,'visible','off');
    set(handles.uipanel15,'visible','off');
    set(handles.uipanel17,'visible','off');
    set(handles.uipanel18,'visible','off');
    set(handles.uipanel19,'visible','on');
    set(handles.uipanel21,'visible','off');
    set(handles.uipanel22,'visible','off');
    set(handles.uipanel23,'visible','off');
end
if x==12
    set(handles.uipanel3,'visible','off');
    set(handles.uipanel8,'visible','off');
    set(handles.uipanel7,'visible','off');
    set(handles.uipanel11,'visible','off');
    set(handles.uipanel12,'visible','off');
    set(handles.uipanel13,'visible','off');
    set(handles.uipanel14,'visible','off');
    set(handles.uipanel15,'visible','off');
    set(handles.uipanel17,'visible','off');
    set(handles.uipanel18,'visible','off');
    set(handles.uipanel19,'visible','off');
    set(handles.uipanel21,'visible','on');
    set(handles.uipanel22,'visible','off');
    set(handles.uipanel23,'visible','off');
end
if x==13
    set(handles.uipanel3,'visible','off');
    set(handles.uipanel8,'visible','off');
    set(handles.uipanel7,'visible','off');
    set(handles.uipanel11,'visible','off');
    set(handles.uipanel12,'visible','off');
    set(handles.uipanel13,'visible','off');
    set(handles.uipanel14,'visible','off');
    set(handles.uipanel15,'visible','off');
    set(handles.uipanel17,'visible','off');
    set(handles.uipanel18,'visible','off');
    set(handles.uipanel19,'visible','off');
    set(handles.uipanel21,'visible','off');
    set(handles.uipanel23,'visible','on');
    set(handles.uipanel22,'visible','off');
end

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
tic;
global enum;
str1='Please wait ...';
str2='LCA is running';
str1=cellstr(str1);
str2=cellstr(str2);
sstr=['Execution number is : ',num2str(enum)];
st=[sstr;str2;str1];
set(handles.listbox1,'string',st);
pause(1);
tp=get(handles.edit10,'string');
tp=str2num(tp);
tp=tp/100;
sv=get(handles.edit9,'string');
nteam= str2num(get(handles.edit15,'string'));
loadedfile=get(handles.edit1,'string');
input=importdata(loadedfile);
labelc=str2num(get(handles.edit2,'string'));
val=get(handles.checkbox23,'value');
if val==1
   input(1,:)=[];
end
val=get(handles.checkbox24,'value');
if val==1
   input(:,1)=[];
end
[m,n]=size(input);
n=n-1;
col=str2num(get(handles.edit63,'string'));
nos=str2num(get(handles.edit18,'string'));
teams=zeros(nteam,col+3);
mtime=str2num(get(handles.edit17,'string'));
teams=initial(teams,n);
nog=str2num(get(handles.edit4,'string'));
label=input(:,labelc);
input(:,labelc)=[];
global hamlca;
global hamalca;
global plca;
global hamclca;
global hamcalca;
global pclca;
global lcaf;
global lcac;
global lcat;
hamlca=[];
hamalca=[];
hamclca=[];
hamcalca=[];
teams=score(teams,input,label,tp,sv);
for g=1:nos
   teams=matchlca(teams,mtime,input,label,tp,sv);
   [f1,f2]=selectminmax(teams);
   hamlca=[hamlca,f1];
   hamclca=[hamclca,f2];
   hamalca=[hamalca,mean(teams(:,col+2))];
   hamcalca=[hamcalca,mean(teams(:,col+3))];
end
team=teams(1,:);
for i=2:nteam
    if teams(i,col+2)<=team(1,col+2)
        team=teams(i,:);
    end
end
global flca;
flca=[flca;team];
pclca=[pclca,max(team(:,col+3))];
teams=team;
st='The value of RMSEis: ';
st=strcat(st,num2str(teams(1,col+2)));
set(handles.listbox1, 'String',st);
st = cellstr(get(handles.listbox1,'string'));
st2='The elapsed time of LCA based on seconds is :  ';
st2=strcat(st2,num2str(toc));
st3='The value of R^2 is :  ';
st3=strcat(st3,num2str(teams(1,col+3)));
features='';
cou=0;
for i=1:col
    flag=1;
    for j=1:i-1
        if teams(1,i)==teams(1,j)
            flag=0;
            break;
        end
    end  
    if flag==1
       cou=cou+1;
       features=strcat(features,',',num2str(teams(1,i)));  
    end
end
lcat=[lcat;cellstr(num2str(toc))];
[a,b]=size(features);
features=features(a,2:b);
features=cellstr(features);
lcaf=[lcaf;features];
lcac=[lcac;cellstr(num2str(cou))];
global lcak;
lcak=[lcak;cou];
x=get(handles.checkbox25,'value');
if x==1
   plca=[plca,teams(1,col+2)];
else
   plca=[plca,teams(1,col+2)]; 
end
st4='Number of selected fetures : ';
st4=strcat(st4,num2str(cou));
ne = [st;st3;st2;features;st4];
set(handles.listbox1,'String',ne);
clc


function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
tic;
str1='Please wait ...';
str2='GA is running';
str1=cellstr(str1);
str2=cellstr(str2);
global enum;
sstr=['Execution number is : ',num2str(enum)];
st=[sstr;str2;str1];
set(handles.listbox1,'string',st);
pause(1);
tp=get(handles.edit10,'string');
tp=str2num(tp);
tp=tp/100;
sv=get(handles.edit9,'string');
npopu= str2num(get(handles.edit19,'string'));
loadedfile=get(handles.edit1,'string');
input=importdata(loadedfile);
labelc=str2num(get(handles.edit2,'string'));
val=get(handles.checkbox23,'value');
if val==1
   input(1,:)=[];
end
val=get(handles.checkbox24,'value');
if val==1
   input(:,1)=[];
end
[m,n]=size(input);
n=n-1;
col=str2num(get(handles.edit63,'string'));
nog=str2num(get(handles.edit22,'string'));
population=zeros(npopu,col+3);
population=initial(population,n);
crate=str2num(get(handles.edit21,'string'));
mrate=str2num(get(handles.edit20,'string'));
label=input(:,labelc);
input(:,labelc)=[];
global hamga;
global hamaga;
global pga;
global hamcga;
global hamcaga;
global pcga;
global gaf;
global gac;
global gat;
hamga=[];
hamaga=[];
hamcga=[];
hamcaga=[];
population=score(population,input,label,tp,sv);
for g=1:nog
   best=population(1,:);
   best=selectbest(population,best);
   population=mutationga(population,mrate,n);
   population=crossoverga(population,crate);
   population=score(population,input,label,tp,sv);
   population=selectionga(population,n);
   population(npopu,:)=best;
   [f1,f2]=selectminmax(population);
   hamga=[hamga,f1];
   hamcga=[hamcga,f2];
   hamaga=[hamaga,mean(population(:,col+2))];
   hamcaga=[hamcaga,mean(population(:,col+3))];
end
mi=population(1,col+2);
teams=population(1,:);
j=1;
for i=2:npopu
    if population(i,col+2)<mi
       mi=population(i,col+2); 
       j=i;
    end
end
teams=population(j,:);
global fga;
fga=[fga;teams];
pcga=[pcga,max(teams(:,col+3))];
st='The value of RMSEis: ';
st=strcat(st,num2str(teams(1,col+2)));
set(handles.listbox1, 'String',st);
st = cellstr(get(handles.listbox1,'string'));
st2='The elapsed time of GA based on seconds is :  ';
st2=strcat(st2,num2str(toc));
st3='The value of R^2 is :  ';
st3=strcat(st3,num2str(teams(1,col+3)));
features='';
cou=0;
for i=1:col
    flag=1;
    for j=1:i-1
        if teams(1,i)==teams(1,j)
            flag=0;
            break;
        end
    end 
    if flag==1
       cou=cou+1;
       features=strcat(features,',',num2str(teams(1,i))); 
    end
end
gat=[gat;cellstr(num2str(toc))];
[a,b]=size(features);
features=features(a,2:b);
features=cellstr(features);
gaf=[gaf;features];
gac=[gac;cellstr(num2str(cou))];
global gak;
gak=[gak;cou];
x=get(handles.checkbox25,'value');
if x==1
   pga=[pga,teams(1,col+2)];
else
   pga=[pga,teams(1,col+2)]; 
end
st4='Number of selected fetures : ';
st4=strcat(st4,num2str(cou));
ne = [st;st3;st2;features;st4];
set(handles.listbox1,'String',ne);
clc


function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit30_Callback(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit30 as text
%        str2double(get(hObject,'String')) returns contents of edit30 as a double


% --- Executes during object creation, after setting all properties.
function edit30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit29_Callback(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit29 as text
%        str2double(get(hObject,'String')) returns contents of edit29 as a double


% --- Executes during object creation, after setting all properties.
function edit29_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit27_Callback(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit27 as text
%        str2double(get(hObject,'String')) returns contents of edit27 as a double


% --- Executes during object creation, after setting all properties.
function edit27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit31_Callback(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit31 as text
%        str2double(get(hObject,'String')) returns contents of edit31 as a double


% --- Executes during object creation, after setting all properties.
function edit31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
tic;
str1='Please wait ...';
str2='PSO is running';
str1=cellstr(str1);
str2=cellstr(str2);
global enum;
sstr=['Execution number is : ',num2str(enum)];
st=[sstr;str2;str1];
set(handles.listbox1,'string',st);
pause(1);
tp=get(handles.edit10,'string');
tp=str2num(tp);
tp=tp/100;
sv=get(handles.edit9,'string');
nopar= str2num(get(handles.edit31,'string'));
loadedfile=get(handles.edit1,'string');
input=importdata(loadedfile);
labelc=str2num(get(handles.edit2,'string'));
val=get(handles.checkbox23,'value');
if val==1
   input(1,:)=[];
end
val=get(handles.checkbox24,'value');
if val==1
   input(:,1)=[];
end
[m,n]=size(input);
n=n-1;
col=str2num(get(handles.edit63,'string'));
nos=str2num(get(handles.edit34,'string'));
particles=zeros(nopar,col+3);
particles=initial(particles,n);
nopbest=str2num(get(handles.edit33,'string'));
label=input(:,labelc);
input(:,labelc)=[];
global hampso;
global hamapso;
global ppso;
global hamcpso;
global hamcapso;
global pcpso;
global psof;
global psoc;
global psot;
hampso=[];
hamapso=[];
hamcpso=[];
hamcapso=[];
particles=score(particles,input,label,tp,sv);
bests=zeros(nopbest,col+3);
for g=1:nos
   bests=selectbest(particles,bests);
   gbest=bests(1,:);
   particles=movepso(particles,bests);
   particles=score(particles,input,label,tp,sv);
   particles(randi(nopar),:)=gbest;
   [f1,f2]=selectminmax(particles);
   hampso=[hampso,f1];
   hamcpso=[hamcpso,f2];
   hamapso=[hamapso,mean(particles(:,col+2))];
   hamcapso=[hamcapso,mean(particles(:,col+3))];
end
mi=particles(1,col+2);
j=1;
for i=2:nopar
    if particles(i,col+2)<mi
       mi=particles(i,col+2); 
       j=i;
    end
end
particles=particles(j,:);
global fpso;
fpso=[fpso;particles];
pcpso=[pcpso,max(particles(:,col+3))];
st='The value of RMSEis: ';
st=strcat(st,num2str(particles(1,col+2)));
set(handles.listbox1, 'String',st);
st = cellstr(get(handles.listbox1,'string'));
st2='The elapsed time of PSO based on seconds is :  ';
st2=strcat(st2,num2str(toc));
st3='The value of R^2 is :  ';
st3=strcat(st3,num2str(particles(1,col+3)));
features='';
cou=0;
for i=1:col
    flag=1;
    for j=1:i-1
        if particles(1,i)==particles(1,j)
            flag=0;
            break;
        end
    end    
    if flag==1
       cou=cou+1;
       features=strcat(features,',',num2str(particles(1,i))); 
    end
end
psot=[psot;cellstr(num2str(toc))];
[a,b]=size(features);
features=features(a,2:b);
features=cellstr(features);
psof=[psof;features];
psoc=[psoc;cellstr(num2str(cou))];
global psok;
psok=[psok;cou];
x=get(handles.checkbox25,'value');
if x==1
   ppso=[ppso,min(particles(:,col+2))];
else
   ppso=[ppso,min(particles(:,col+2))]; 
end
st4='Number of selected fetures : ';
st4=strcat(st4,num2str(cou));
ne = [st;st3;st2;features;st4];
set(handles.listbox1,'String',ne);
clc


function edit33_Callback(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit33 as text
%        str2double(get(hObject,'String')) returns contents of edit33 as a double


% --- Executes during object creation, after setting all properties.
function edit33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit34_Callback(hObject, eventdata, handles)
% hObject    handle to edit34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit34 as text
%        str2double(get(hObject,'String')) returns contents of edit34 as a double


% --- Executes during object creation, after setting all properties.
function edit34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit35_Callback(hObject, eventdata, handles)
% hObject    handle to edit35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit35 as text
%        str2double(get(hObject,'String')) returns contents of edit35 as a double


% --- Executes during object creation, after setting all properties.
function edit35_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
tic;
str1='Please wait ...';
str2='ACO is running';
str1=cellstr(str1);
str2=cellstr(str2);
global enum;
sstr=['Execution number is : ',num2str(enum)];
st=[sstr;str2;str1];
set(handles.listbox1,'string',st);
pause(1);
tp=get(handles.edit10,'string');
tp=str2num(tp);
tp=tp/100;
sv=get(handles.edit9,'string');
noant= str2num(get(handles.edit35,'string'));
loadedfile=get(handles.edit1,'string');
input=importdata(loadedfile);
labelc=str2num(get(handles.edit2,'string'));
val=get(handles.checkbox23,'value');
if val==1
   input(1,:)=[];
end
val=get(handles.checkbox24,'value');
if val==1
   input(:,1)=[];
end
[m,n]=size(input);
n=n-1;
col=str2num(get(handles.edit63,'string'));
nos=str2num(get(handles.edit37,'string'));
ants=zeros(noant,col+3);
ants=initial(ants,n);
erate=str2num(get(handles.edit36,'string'));
label=input(:,labelc);
input(:,labelc)=[];
global hamaco;
global hamaaco;
global paco;
global hamcaco;
global hamcaaco;
global pcaco;
hamaco=[];
hamaaco=[];
hamcaco=[];
hamcaaco=[];
global acof;
global acoc;
global acot;
ants=score(ants,input,label,tp,sv);
bests=zeros(round(noant*0.05),col+4);
bests(:,1:col+3)=selectbest(ants,bests(:,1:col+3));
bests(:,col+4)=erate;
for g=1:nos
   best=bests(1,:);
   best=selectbest(ants,best(:,1:col+3)); 
   [ants,bests]=moveants(ants,bests,input,label,tp,sv,erate);
   k=randi(noant);
   ants(k,:)=best;
   [f1,f2]=selectminmax(ants);
   hamaco=[hamaco,f1];
   hamcaco=[hamcaco,f2];
   hamaaco=[hamaaco,mean(ants(:,col+2))];
   hamcaaco=[hamcaaco,mean(ants(:,col+3))];
end
mi=ants(1,col+2);
j=1;
for i=2:noant
    if ants(i,col+2)<mi
       mi=ants(i,col+2); 
       j=i;
    end
end
ants=ants(j,1:col+3);
global faco;
faco=[faco;ants];
pcaco=[pcaco,max(ants(:,col+3))];
st='The value of RMSEis: ';
st=strcat(st,num2str(ants(1,col+2)));
set(handles.listbox1, 'String',st);
st = cellstr(get(handles.listbox1,'string'));
st2='The elapsed time of ACO based on seconds is :  ';
st2=strcat(st2,num2str(toc));
st3='The value of R^2 is :  ';
st3=strcat(st3,num2str(ants(1,col+3)));
features='';
cou=0;
for i=1:col
    flag=1;
    for j=1:i-1
        if ants(1,i)==ants(1,j)
            flag=0;
            break;
        end
    end 
    if flag==1
       cou=cou+1;
       features=strcat(features,',',num2str(ants(1,i))); 
    end
end
acot=[acot;cellstr(num2str(toc))];
[a,b]=size(features);
features=features(a,2:b);
features=cellstr(features);
acof=[acof;features];
acoc=[acoc;cellstr(num2str(cou))];
global acok;
acok=[acok;cou];
x=get(handles.checkbox25,'value');
if x==1
   paco=[paco,min(ants(:,col+2))];
else
   paco=[paco,min(ants(:,col+2))]; 
end
st4='Number of selected fetures : ';
st4=strcat(st4,num2str(cou));
ne = [st;st3;st2;features;st4];
set(handles.listbox1,'String',ne);
clc


function edit36_Callback(hObject, eventdata, handles)
% hObject    handle to edit36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit36 as text
%        str2double(get(hObject,'String')) returns contents of edit36 as a double


% --- Executes during object creation, after setting all properties.
function edit36_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit37_Callback(hObject, eventdata, handles)
% hObject    handle to edit37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit37 as text
%        str2double(get(hObject,'String')) returns contents of edit37 as a double


% --- Executes during object creation, after setting all properties.
function edit37_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit38_Callback(hObject, eventdata, handles)
% hObject    handle to edit38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit38 as text
%        str2double(get(hObject,'String')) returns contents of edit38 as a double


% --- Executes during object creation, after setting all properties.
function edit38_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
tic;
str1='Please wait ...';
str2='ICA is running';
str1=cellstr(str1);
str2=cellstr(str2);
global enum;
sstr=['Execution number is : ',num2str(enum)];
st=[sstr;str2;str1];
set(handles.listbox1,'string',st);
pause(1);
tp=get(handles.edit10,'string');
tp=str2num(tp);
tp=tp/100;
sv=get(handles.edit9,'string');
ncountries= str2num(get(handles.edit38,'string'));
loadedfile=get(handles.edit1,'string');
input=importdata(loadedfile);
labelc=str2num(get(handles.edit2,'string'));
val=get(handles.checkbox23,'value');
if val==1
   input(1,:)=[];
end
val=get(handles.checkbox24,'value');
if val==1
   input(:,1)=[];
end
[m,n]=size(input);
n=n-1;
col=str2num(get(handles.edit63,'string'));
countries=zeros(ncountries,col+3);
countries=initial(countries,n);
noi=str2num(get(handles.edit40,'string'));
countries=groupingica(countries,noi,ncountries);
label=input(:,labelc);
input(:,labelc)=[];
global hamica;
global hamaica;
global pica;
global hamcica;
global hamcaica;
global pcica;
global icaf;
global icac;
global icat;
hamica=[];
hamaica=[];
hamcica=[];
hamcaica=[];
countries=score(countries,input,label,tp,sv);
imper=zeros(1,noi);
imper=selectimper(countries,imper);
countries=moveica(countries,imper);
while noi>1
    countries=revoulation(countries,n);
    countries=moveica(countries,imper);
    countries=score(countries,input,label,tp,sv);
    imper=zeros(1,noi);
    imper=selectimper(countries,imper);
    countries=updateimper(countries,imper);
    noi=noi-1;
    w=selectweak(countries,imper);
    countries=absorb(countries,w,imper);
    [f1,f2]=selectminmax(countries);
    hamica=[hamica,f1];
    hamcica=[hamcica,f2];
    hamaica=[hamaica,mean(countries(:,col+2))];
    hamcaica=[hamcaica,mean(countries(:,col+3))];
end
mi=countries(1,col+2);
s=1;
for i=2:ncountries
    if countries(i,col+2)<mi
        mi=countries(i,col+2);
        s=i;
    end
end
countries=countries(s,:);
global fica;
fica=[fica;countries];
pcica=[pcica,max(countries(:,col+3))];
st='The value of RMSEis: ';
st=strcat(st,num2str(countries(1,col+2)));
set(handles.listbox1, 'String',st);
st = cellstr(get(handles.listbox1,'string'));
st2='The elapsed time of ICA based on seconds is :  ';
st2=strcat(st2,num2str(toc));
st3='The value of R^2 is :  ';
st3=strcat(st3,num2str(countries(1,col+3)));
features='';
cou=0;
for i=1:col
    flag=1;
    for j=1:i-1
        if countries(1,i)==countries(1,j)
            flag=0;
            break;
        end
    end   
    if flag==1
       cou=cou+1;
       features=strcat(features,',',num2str(countries(1,i))); 
    end
end
icat=[icat;cellstr(num2str(toc))];
[a,b]=size(features);
features=features(a,2:b);
features=cellstr(features);
icaf=[icaf;features];
icac=[icac;cellstr(num2str(cou))];
global icak;
icak=[icak;cou];
x=get(handles.checkbox25,'value');
if x==1
   pica=[pica,min(countries(:,col+2))];
else
   pica=[pica,min(countries(:,col+2))]; 
end
st4='Number of selected fetures : ';
st4=strcat(st4,num2str(cou));
ne = [st;st3;st2;features;st4];
set(handles.listbox1,'String',ne);
clc



function edit40_Callback(hObject, eventdata, handles)
% hObject    handle to edit40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit40 as text
%        str2double(get(hObject,'String')) returns contents of edit40 as a double


% --- Executes during object creation, after setting all properties.
function edit40_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit41_Callback(hObject, eventdata, handles)
% hObject    handle to edit41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit41 as text
%        str2double(get(hObject,'String')) returns contents of edit41 as a double


% --- Executes during object creation, after setting all properties.
function edit41_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
tic;
str1='Please wait ...';
str2='LA is running';
str1=cellstr(str1);
str2=cellstr(str2);
global enum;
sstr=['Execution number is : ',num2str(enum)];
st=[sstr;str2;str1];
set(handles.listbox1,'string',st);
pause(1);
tp=get(handles.edit10,'string');
tp=str2num(tp);
tp=tp/100;
sv=get(handles.edit9,'string');
lan= 1;
loadedfile=get(handles.edit1,'string');
input=importdata(loadedfile);
labelc=str2num(get(handles.edit2,'string'));
val=get(handles.checkbox23,'value');
if val==1
   input(1,:)=[];
end
val=get(handles.checkbox24,'value');
if val==1
   input(:,1)=[];
end
[m,n]=size(input);
n=n-1;
col=str2num(get(handles.edit63,'string'));
nos=str2num(get(handles.edit41,'string'));
la=zeros(lan,col+3);
mtime=str2num(get(handles.edit42,'string'));
la=initial(la,n);
label=input(:,labelc);
input(:,labelc)=[];
global hamla;
global hamala;
global pla;
global hamcla;
global hamcala;
global pcla;
global laf;
global lac;
global lat;
hamla=[];
hamala=[];
hamcla=[];
hamcala=[];
la=score(la,input,label,tp,sv);
for g=1:nos
   la=latry(la,mtime,input,label,tp,sv,n);
   [f1,f2]=selectminmax(la);
   hamla=[hamla,f1];
   hamcla=[hamcla,f2];
   hamala=[hamala,mean(la(:,col+2))];
   hamcala=[hamcala,mean(la(:,col+3))];
end
pcla=[pcla,max(la(:,col+3))];
global fla;
fla=[fla;la];
st='The value of RMSEis: ';
st=strcat(st,num2str(la(1,col+2)));
set(handles.listbox1, 'String',st);
st = cellstr(get(handles.listbox1,'string'));
st2='The elapsed time of LA based on seconds is :  ';
st2=strcat(st2,num2str(toc));
st3='The value of R^2 is :  ';
st3=strcat(st3,num2str(la(1,col+3)));
features='';
cou=0;
for i=1:col
    flag=1;
    for j=1:i-1
        if la(1,i)==la(1,j)
            flag=0;
            break;
        end
    end    
    if flag==1
       cou=cou+1;
       features=strcat(features,',',num2str(la(1,i))); 
    end
end
lat=[lat;cellstr(num2str(toc))];
[a,b]=size(features);
features=features(a,2:b);
features=cellstr(features);
laf=[laf;features];
lac=[lac;cellstr(num2str(cou))];
global lak;
lak=[lak;cou];
x=get(handles.checkbox25,'value');
if x==1
   pla=[pla,min(la(:,col+2))];
else
   pla=[pla,min(la(:,col+2))]; 
end
st4='Number of selected fetures : ';
st4=strcat(st4,num2str(cou));
ne = [st;st3;st2;features;st4];
set(handles.listbox1,'String',ne);
clc


function edit42_Callback(hObject, eventdata, handles)
% hObject    handle to edit42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit42 as text
%        str2double(get(hObject,'String')) returns contents of edit42 as a double


% --- Executes during object creation, after setting all properties.
function edit42_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit43_Callback(hObject, eventdata, handles)
% hObject    handle to edit43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit43 as text
%        str2double(get(hObject,'String')) returns contents of edit43 as a double


% --- Executes during object creation, after setting all properties.
function edit43_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit44_Callback(hObject, eventdata, handles)
% hObject    handle to edit44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit44 as text
%        str2double(get(hObject,'String')) returns contents of edit44 as a double


% --- Executes during object creation, after setting all properties.
function edit44_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit45_Callback(hObject, eventdata, handles)
% hObject    handle to edit45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit45 as text
%        str2double(get(hObject,'String')) returns contents of edit45 as a double


% --- Executes during object creation, after setting all properties.
function edit45_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit46_Callback(hObject, eventdata, handles)
% hObject    handle to edit46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit46 as text
%        str2double(get(hObject,'String')) returns contents of edit46 as a double


% --- Executes during object creation, after setting all properties.
function edit46_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
tic;
str1='Please wait ...';
str2='HTS is running';
str1=cellstr(str1);
str2=cellstr(str2);
global enum;
sstr=['Execution number is : ',num2str(enum)];
st=[sstr;str2;str1];
set(handles.listbox1,'string',st);
pause(1);
tp=get(handles.edit10,'string');
tp=str2num(tp);
tp=tp/100;
sv=get(handles.edit9,'string');
nmolecules= str2num(get(handles.edit51,'string'));
loadedfile=get(handles.edit1,'string');
input=importdata(loadedfile);
labelc=str2num(get(handles.edit2,'string'));
val=get(handles.checkbox23,'value');
if val==1
   input(1,:)=[];
end
val=get(handles.checkbox24,'value');
if val==1
   input(:,1)=[];
end
[m,n]=size(input);
n=n-1;
col=str2num(get(handles.edit63,'string'));
noi=str2num(get(handles.edit52,'string'));
molecules=zeros(nmolecules,col+3);
molecules=initial(molecules,n);

cdf=str2num(get(handles.edit50,'string'));
cof=str2num(get(handles.edit49,'string'));
rdf=str2num(get(handles.edit48,'string'));

label=input(:,labelc);
input(:,labelc)=[];

molecules=score(molecules,input,label,tp,sv);
global hamhts;
global hamahts;
global phts;
global hamchts;
global hamcahts;
global pchts;
global htsf;
global htsc;
global htst;
hamhts=[];
hamahts=[];
hamchts=[];
hamcahts=[];

for g=1:noi
   r=randi(1);
   if r<=0.33
       molecules=conduction(molecules,r,input,label,tp,sv,cdf,g,noi);
   end
   if (r>0.33) && (r<=0.66)
       molecules=convection(molecules,r,input,label,tp,sv,cof,g,noi);
   end
   if r>0.66
       molecules=radiation(molecules,r,input,label,tp,sv,rdf,g,noi);
   end
   molecules=replaceworst(molecules,n);
   [f1,f2]=selectminmax(molecules);
   hamhts=[hamhts,f1];
   hamchts=[hamchts,f2];
   hamahts=[hamahts,mean(molecules(:,col+2))];
   hamcahts=[hamcahts,mean(molecules(:,col+3))];
end
mi=molecules(1,col+2);
j=1;
for i=2:nmolecules
    if molecules(i,col+2)<mi
       mi=molecules(i,col+2); 
       j=i;
    end
end
molecules=molecules(j,:);
global fhts;
fhts=[fhts;molecules];
pchts=[pchts,max(molecules(:,col+3))];
st='The value of RMSEis: ';
st=strcat(st,num2str(molecules(1,col+2)));
set(handles.listbox1, 'String',st);
st = cellstr(get(handles.listbox1,'string'));
st2='The elapsed time of HTS based on seconds is :  ';
st2=strcat(st2,num2str(toc));
st3='The value of R^2 is :  ';
st3=strcat(st3,num2str(molecules(1,col+3)));
features='';
cou=0;
for i=1:col
    flag=1;
    for j=1:i-1
        if molecules(1,i)==molecules(1,j)
            flag=0;
            break;
        end
    end 
    if flag==1
       cou=cou+1;
       features=strcat(features,',',num2str(molecules(1,i))); 
    end
end
htst=[htst;cellstr(num2str(toc))];
[a,b]=size(features);
features=features(a,2:b);
features=cellstr(features);
htsf=[htsf;features];
htsc=[htsc;cellstr(num2str(cou))];
global htsk;
htsk=[htsk;cou];
x=get(handles.checkbox25,'value');
if x==1
   phts=[phts,min(molecules(:,col+2))];
else
   phts=[phts,min(molecules(:,col+2))]; 
end
st4='Number of selected fetures : ';
st4=strcat(st4,num2str(cou));
ne = [st;st3;st2;features;st4];
set(handles.listbox1,'String',ne);
clc


function edit50_Callback(hObject, eventdata, handles)
% hObject    handle to edit50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit50 as text
%        str2double(get(hObject,'String')) returns contents of edit50 as a double


% --- Executes during object creation, after setting all properties.
function edit50_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit49_Callback(hObject, eventdata, handles)
% hObject    handle to edit49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit49 as text
%        str2double(get(hObject,'String')) returns contents of edit49 as a double


% --- Executes during object creation, after setting all properties.
function edit49_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit48_Callback(hObject, eventdata, handles)
% hObject    handle to edit48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit48 as text
%        str2double(get(hObject,'String')) returns contents of edit48 as a double


% --- Executes during object creation, after setting all properties.
function edit48_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit51_Callback(hObject, eventdata, handles)
% hObject    handle to edit51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit51 as text
%        str2double(get(hObject,'String')) returns contents of edit51 as a double


% --- Executes during object creation, after setting all properties.
function edit51_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit52_Callback(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit52 as text
%        str2double(get(hObject,'String')) returns contents of edit52 as a double


% --- Executes during object creation, after setting all properties.
function edit52_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
tic;
str1='Please wait ...';
str2='FOA is running';
str1=cellstr(str1);
str2=cellstr(str2);
global enum;
sstr=['Execution number is : ',num2str(enum)];
st=[sstr;str2;str1];
set(handles.listbox1,'string',st);
pause(1);
tp=get(handles.edit10,'string');
tp=str2num(tp);
tp=tp/100;
sv=get(handles.edit9,'string');
ntrees= str2num(get(handles.edit56,'string'));
loadedfile=get(handles.edit1,'string');
input=importdata(loadedfile);
labelc=str2num(get(handles.edit2,'string'));
val=get(handles.checkbox23,'value');
if val==1
   input(1,:)=[];
end
val=get(handles.checkbox24,'value');
if val==1
   input(:,1)=[];
end
[m,n]=size(input);
n=n-1;
col=str2num(get(handles.edit63,'string'));
noi=str2num(get(handles.edit57,'string'));
trees=zeros(ntrees,col+3);
trees=initial(trees,n);
label=input(:,labelc);
input(:,labelc)=[];
trees=score(trees,input,label,tp,sv);
bests=zeros(round(ntrees*0.05),col+3);
global hamfoa;
global hamafoa;
global pfoa;
global hamcfoa;
global hamcafoa;
global pcfoa;
global foaf;
global foac;
global foat;
hamfoa=[];
hamafoa=[];
hamcfoa=[];
hamcafoa=[];
for g=1:noi
   bests=selectbest(trees,bests);
   trees=localseeding(trees,bests,input,label,tp,sv); 
   trees=globalseeding(trees,bests,input,label,tp,sv); 
   [f1,f2]=selectminmax(trees);
   hamfoa=[hamfoa,f1];
   hamcfoa=[hamcfoa,f2];
   hamafoa=[hamafoa,mean(trees(:,col+2))];
   hamcafoa=[hamcafoa,mean(trees(:,col+3))];
end
mi=trees(1,col+2);
j=1;
for i=2:ntrees
    if trees(i,col+2)<mi
       mi=trees(i,col+2); 
       j=i;
    end
end
trees=trees(j,:);
global ffoa;
ffoa=[ffoa;trees];
pcfoa=[pcfoa,max(trees(:,col+3))];
st='The value of RMSEis: ';
st=strcat(st,num2str(trees(1,col+2)));
set(handles.listbox1, 'String',st);
st = cellstr(get(handles.listbox1,'string'));
st2='The elapsed time of FOA based on seconds is :  ';
st2=strcat(st2,num2str(toc));
st3='The value of R^2 is :  ';
st3=strcat(st3,num2str(trees(1,col+3)));
features='';
cou=0;
for i=1:col
    flag=1;
    for j=1:i-1
        if trees(1,i)==trees(1,j)
            flag=0;
            break;
        end
    end 
    if flag==1  
       cou=cou+1;
       features=strcat(features,',',num2str(trees(1,i))); 
    end
end
foat=[foat;cellstr(num2str(toc))];
[a,b]=size(features);
features=features(a,2:b);
features=cellstr(features);
foaf=[foaf;features];
foac=[foac;cellstr(num2str(cou))];
global foak;
foak=[foak;cou];
x=get(handles.checkbox25,'value');
if x==1
   pfoa=[pfoa,min(trees(:,col+2))];
else
   pfoa=[pfoa,min(trees(:,col+2))]; 
end
st4='Number of selected fetures : ';
st4=strcat(st4,num2str(cou));
ne = [st;st3;st2;features;st4];
set(handles.listbox1,'String',ne);
clc


function edit56_Callback(hObject, eventdata, handles)
% hObject    handle to edit56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit56 as text
%        str2double(get(hObject,'String')) returns contents of edit56 as a double


% --- Executes during object creation, after setting all properties.
function edit56_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit57_Callback(hObject, eventdata, handles)
% hObject    handle to edit57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit57 as text
%        str2double(get(hObject,'String')) returns contents of edit57 as a double


% --- Executes during object creation, after setting all properties.
function edit57_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
tic;
str1='Please wait ...';
str2='DSOS is running';
str1=cellstr(str1);
str2=cellstr(str2);
global enum;
sstr=['Execution number is : ',num2str(enum)];
st=[sstr;str2;str1];
set(handles.listbox1,'string',st);
pause(1);
tp=get(handles.edit10,'string');
tp=str2num(tp);
tp=tp/100;
sv=get(handles.edit9,'string');
npopu= str2num(get(handles.edit58,'string'));
loadedfile=get(handles.edit1,'string');
input=importdata(loadedfile);
labelc=str2num(get(handles.edit2,'string'));
val=get(handles.checkbox23,'value');
if val==1
   input(1,:)=[];
end
val=get(handles.checkbox24,'value');
if val==1
   input(:,1)=[];
end
[m,n]=size(input);
n=n-1;
col=str2num(get(handles.edit63,'string'));
noi=str2num(get(handles.edit59,'string'));
organisms=zeros(npopu,col+3);
organisms=initial(organisms,n);
label=input(:,labelc);
input(:,labelc)=[];
organisms=score(organisms,input,label,tp,sv);
best=zeros(1,col+3);
global hamdsos;
global hamadsos;
global pdsos;
global hamcdsos;
global hamcadsos;
global pcdsos;
global dsosf;
global dsosc;
global dsost;
hamdsos=[];
hamadsos=[];
hamcdsos=[];
hamcadsos=[];
for g=1:noi
   best=selectbest(organisms,best);
   organisms=hamzisti(organisms,best,input,label,tp,sv);
   organisms=hamparvari(organisms,best,input,label,tp,sv);
   [f1,f2]=selectminmax(organisms);
   hamdsos=[hamdsos,f1];
   hamcdsos=[hamcdsos,f2];
   hamadsos=[hamadsos,mean(organisms(:,col+2))];
   hamcadsos=[hamcadsos,mean(organisms(:,col+3))];
end
mi=organisms(1,col+2);
teams=organisms(1,:);
j=1;
for i=2:npopu
    if organisms(i,col+2)<mi
       mi=organisms(i,col+2); 
       j=i;
    end
end
organisms=organisms(j,:);
global fdsos;
fdsos=[fdsos;organisms];
pcdsos=[pcdsos,max(organisms(:,col+3))];
st='The value of RMSEis: ';
st=strcat(st,num2str(organisms(1,col+2)));
set(handles.listbox1, 'String',st);
st = cellstr(get(handles.listbox1,'string'));
st2='The elapsed time of DSOS based on seconds is :  ';
st2=strcat(st2,num2str(toc));
st3='The value of R^2 is :  ';
st3=strcat(st3,num2str(organisms(1,col+3)));
features='';
cou=0;
for i=1:col
    flag=1;
    for j=1:i-1
        if organisms(1,i)==organisms(1,j)
            flag=0;
            break;
        end
    end   
    if flag==1 
       cou=cou+1;
       features=strcat(features,',',num2str(organisms(1,i))); 
    end
end
dsost=[dsost;cellstr(num2str(toc))];
[a,b]=size(features);
features=features(a,2:b);
features=cellstr(features);
dsosf=[dsosf;features];
dsosc=[dsosc;cellstr(num2str(cou))];
global dsosk;
dsosk=[dsosk;cou];
x=get(handles.checkbox25,'value');
if x==1
   pdsos=[pdsos,min(organisms(:,col+2))];
else
   pdsos=[pdsos,min(organisms(:,col+2))]; 
end
st4='Number of selected fetures : ';
st4=strcat(st4,num2str(cou));
ne = [st;st3;st2;features;st4];
set(handles.listbox1,'String',ne);
clc


function edit58_Callback(hObject, eventdata, handles)
% hObject    handle to edit58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit58 as text
%        str2double(get(hObject,'String')) returns contents of edit58 as a double


% --- Executes during object creation, after setting all properties.
function edit58_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit59_Callback(hObject, eventdata, handles)
% hObject    handle to edit59 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit59 as text
%        str2double(get(hObject,'String')) returns contents of edit59 as a double


% --- Executes during object creation, after setting all properties.
function edit59_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit59 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
tic;
str1='Please wait ...';
str2='CUK is running';
str1=cellstr(str1);
str2=cellstr(str2);
global enum;
sstr=['Execution number is : ',num2str(enum)];
st=[sstr;str2;str1];
set(handles.listbox1,'string',st);
pause(1);
tp=get(handles.edit10,'string');
tp=str2num(tp);
tp=tp/100;
sv=get(handles.edit9,'string');
ne= str2num(get(handles.edit60,'string'));
loadedfile=get(handles.edit1,'string');
input=importdata(loadedfile);
labelc=str2num(get(handles.edit2,'string'));
val=get(handles.checkbox23,'value');
if val==1
   input(1,:)=[];
end
val=get(handles.checkbox24,'value');
if val==1
   input(:,1)=[];
end
[m,n]=size(input);
n=n-1;
col=str2num(get(handles.edit63,'string'));
noi=str2num(get(handles.edit61,'string'));
nc=str2num(get(handles.edit62,'string'));
eggs=zeros(ne,col+3);
eggs=initial(eggs,n);
non=ne/5;
label=input(:,labelc);
input(:,labelc)=[];
global hamcuk;
global hamacuk;
global pcuk;
global hamccuk;
global hamcacuk;
global pccuk;
global cukf;
global cukc;
global cukt;
hamcuk=[];
hamacuk=[];
hamccuk=[];
hamcacuk=[];
eggs=grouping(eggs,non,ne); 
eggs=score(eggs,input,label,tp,sv);
for g=1:noi
   eggs=cuckoomove(eggs,input,label,tp,sv,nc);
   [f1,f2]=selectminmax(eggs);
   hamcuk=[hamcuk,f1];
   hamccuk=[hamccuk,f2];
   hamacuk=[hamacuk,mean(eggs(:,col+2))];
   hamcacuk=[hamcacuk,mean(eggs(:,col+3))];
end
mi=eggs(1,col+2);
j=1;
for i=2:ne
    if eggs(i,col+2)<mi
       mi=eggs(i,col+2); 
       j=i;
    end
end
eggs=eggs(j,:);
global fcuk;
fcuk=[fcuk;eggs];
pccuk=[pccuk,max(eggs(:,col+3))];
st='The value of RMSEis: ';
st=strcat(st,num2str(eggs(1,col+2)));
set(handles.listbox1, 'String',st);
st = cellstr(get(handles.listbox1,'string'));
st2='The elapsed time of Cuckoo based on seconds is :  ';
st2=strcat(st2,num2str(toc));
st3='The value of R^2 is :  ';
st3=strcat(st3,num2str(eggs(1,col+3)));
features='';
cou=0;
for i=1:col
    flag=1;
    for j=1:i-1
        if eggs(1,i)==eggs(1,j)
            flag=0;
            break;
        end
    end
    if flag==1
       cou=cou+1;
       features=strcat(features,',',num2str(eggs(1,i))); 
    end
end
cukt=[cukt;cellstr(num2str(toc))];
[a,b]=size(features);
features=features(a,2:b);
features=cellstr(features);
cukf=[cukf;features];
cukc=[cukc;cellstr(num2str(cou))];
global cukk;
cukk=[cukk;cou];
x=get(handles.checkbox25,'value');
if x==1
   pcuk=[pcuk,min(eggs(:,col+2))];
else
   pcuk=[pcuk,min(eggs(:,col+2))]; 
end
st4='Number of selected fetures : ';
st4=strcat(st4,num2str(cou));
ne = [st;st3;st2;features;st4];
set(handles.listbox1,'String',ne);
clc


function edit60_Callback(hObject, eventdata, handles)
% hObject    handle to edit60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit60 as text
%        str2double(get(hObject,'String')) returns contents of edit60 as a double


% --- Executes during object creation, after setting all properties.
function edit60_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit61_Callback(hObject, eventdata, handles)
% hObject    handle to edit61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit61 as text
%        str2double(get(hObject,'String')) returns contents of edit61 as a double


% --- Executes during object creation, after setting all properties.
function edit61_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit62_Callback(hObject, eventdata, handles)
% hObject    handle to edit62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit62 as text
%        str2double(get(hObject,'String')) returns contents of edit62 as a double


% --- Executes during object creation, after setting all properties.
function edit62_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit63_Callback(hObject, eventdata, handles)
% hObject    handle to edit63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit63 as text
%        str2double(get(hObject,'String')) returns contents of edit63 as a double


% --- Executes during object creation, after setting all properties.
function edit63_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
tic;
str1='Please wait ...';
str2='SVM is running';
str1=cellstr(str1);
str2=cellstr(str2);
st=[str2;str1];
set(handles.listbox1,'string',st);
pause(1);
tp=get(handles.edit10,'string');
tp=str2num(tp);
tp=tp/100;
sv=get(handles.edit9,'string');
nopar= 1;
loadedfile=get(handles.edit1,'string');
input=importdata(loadedfile);
labelc=str2num(get(handles.edit2,'string'));
val=get(handles.checkbox23,'value');
if val==1
   input(1,:)=[];
end
val=get(handles.checkbox24,'value');
if val==1
   input(:,1)=[];
end
[m,n]=size(input);
n=n-1;
particles=1:n+3;
label=input(:,labelc);
input(:,labelc)=[];
particles=score(particles,input,label,tp,sv);
x=get(handles.checkbox25,'value');
if x==1
st='The value of RMSE is: ';
else
st='The value of Score is: ';    
end
if x==1
st=strcat(st,num2str(particles(1,n+2)));
else
st=strcat(st,num2str(-particles(1,n+2)));
end
set(handles.listbox1, 'String',st);
st = cellstr(get(handles.listbox1,'string'));
st2='The elapsed time of SVM based on seconds is :  ';
st2=strcat(st2,num2str(toc));
st3='The value of R^2 is :  ';
st3=strcat(st3,num2str(particles(1,n+3)));
if contains(sv,'-v')
   st3='The accuracy is relative to cross validation'; 
end
set(handles.listbox1, 'String',[st;st2;st3]);
clc


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lf=get(handles.edit1,'string');
inputnormalized=importdata(lf);
tn=get(handles.edit2,'string');
[m,n]=size(inputnormalized);
a=1;
b=1;
x=get(handles.checkbox23,'value');
if x==1
    a=2;
end
x=get(handles.checkbox24,'value');
if x==1
    b=2;
end
for i=a:n
    mi=min(inputnormalized(2:m,i));
    ma=max(inputnormalized(2:m,i));
    if ((i~=str2num(tn)))
        for j=b:m
            inputnormalized(j,i)=(inputnormalized(j,i)-mi)/(ma-mi);
        end
    end
end
if exist('normalizedinput.txt', 'file')==2
  delete('normalizedinput.txt');
end
dlmwrite('normalizedinput.txt',inputnormalized);
set(handles.edit1,'string','normalizedinput.txt');

% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lf=get(handles.edit1,'string');
inputnormalized=importdata(lf);
tn=get(handles.edit2,'string');
[m,n]=size(inputnormalized);
a=1;
b=1;
x=get(handles.checkbox23,'value');
if x==1
    a=2;
end
x=get(handles.checkbox24,'value');
if x==1
    b=2;
end
x=get(handles.checkbox25,'value');
for i=a:n
    mi=min(inputnormalized(2:m,i));
    avg=mean(inputnormalized(2:m,i));
    if ((i~=str2num(tn)))
        for j=b:m
            inputnormalized(j,i)=abs(inputnormalized(j,i)-avg)/(avg-mi);
        end
    end
end
if exist('fuzzifiedinput.txt', 'file')==2
  delete('fuzzifiedinput.txt');
end
dlmwrite('fuzzifiedinput.txt',inputnormalized);
set(handles.edit1,'string','fuzzifiedinput.txt');


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Parameters;


% --- Executes on key press with focus on pushbutton22 and none of its controls.
function pushbutton22_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function edit73_Callback(hObject, eventdata, handles)
% hObject    handle to edit73 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit73 as text
%        str2double(get(hObject,'String')) returns contents of edit73 as a double


% --- Executes during object creation, after setting all properties.
function edit73_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit73 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit72_Callback(hObject, eventdata, handles)
% hObject    handle to edit72 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit72 as text
%        str2double(get(hObject,'String')) returns contents of edit72 as a double


% --- Executes during object creation, after setting all properties.
function edit72_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit72 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit71_Callback(hObject, eventdata, handles)
% hObject    handle to edit71 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit71 as text
%        str2double(get(hObject,'String')) returns contents of edit71 as a double


% --- Executes during object creation, after setting all properties.
function edit71_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit71 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit70_Callback(hObject, eventdata, handles)
% hObject    handle to edit70 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit70 as text
%        str2double(get(hObject,'String')) returns contents of edit70 as a double


% --- Executes during object creation, after setting all properties.
function edit70_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit70 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9



function edit74_Callback(hObject, eventdata, handles)
% hObject    handle to edit74 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit74 as text
%        str2double(get(hObject,'String')) returns contents of edit74 as a double


% --- Executes during object creation, after setting all properties.
function edit74_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit74 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox10


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11


% --- Executes on button press in checkbox12.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox12
cou=0;
g=get(handles.checkbox12,'value');
if g==1
    set(handles.pushbutton24,'string','Run WCC');
    cou=cou+1;
end
g=get(handles.checkbox13,'value');
if g==1
    set(handles.pushbutton24,'string','Run LCA');
    cou=cou+1;
end
g=get(handles.checkbox14,'value');
if g==1
    set(handles.pushbutton24,'string','Run GA');
    cou=cou+1;
end
g=get(handles.checkbox15,'value');
if g==1
    set(handles.pushbutton24,'string','Run PSO');
    cou=cou+1;
end
g=get(handles.checkbox16,'value');
if g==1
    set(handles.pushbutton24,'string','Run ACO');
    cou=cou+1;
end
g=get(handles.checkbox17,'value');
if g==1
    set(handles.pushbutton24,'string','Run ICA');
    cou=cou+1;
end
g=get(handles.checkbox18,'value');
if g==1
    set(handles.pushbutton24,'string','Run LA');
    cou=cou+1;
end
g=get(handles.checkbox19,'value');
if g==1
    set(handles.pushbutton24,'string','Run HTS');
    cou=cou+1;
end
g=get(handles.checkbox20,'value');
if g==1
    set(handles.pushbutton24,'string','Run FOA');
    cou=cou+1;
end
g=get(handles.checkbox21,'value');
if g==1
    set(handles.pushbutton24,'string','Run DSOS');
    cou=cou+1;
end
g=get(handles.checkbox22,'value');
if g==1
    set(handles.pushbutton24,'string','Run CUK');
    cou=cou+1;
end
if cou>1
    set(handles.pushbutton24,'string','Batch runing');
end
set(handles.pushbutton24,'enable','on');
if cou==0
    set(handles.pushbutton24,'enable','off');
    set(handles.pushbutton24,'string','not selected');
end
g=get(handles.checkbox12,'value');
if g==1
   Wccpara;
end


% --- Executes on button press in checkbox13.
function checkbox13_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox13
cou=0;
g=get(handles.checkbox12,'value');
if g==1
    set(handles.pushbutton24,'string','Run WCC');
    cou=cou+1;
end
g=get(handles.checkbox13,'value');
if g==1
    set(handles.pushbutton24,'string','Run LCA');
    cou=cou+1;
end
g=get(handles.checkbox14,'value');
if g==1
    set(handles.pushbutton24,'string','Run GA');
    cou=cou+1;
end
g=get(handles.checkbox15,'value');
if g==1
    set(handles.pushbutton24,'string','Run PSO');
    cou=cou+1;
end
g=get(handles.checkbox16,'value');
if g==1
    set(handles.pushbutton24,'string','Run ACO');
    cou=cou+1;
end
g=get(handles.checkbox17,'value');
if g==1
    set(handles.pushbutton24,'string','Run ICA');
    cou=cou+1;
end
g=get(handles.checkbox18,'value');
if g==1
    set(handles.pushbutton24,'string','Run LA');
    cou=cou+1;
end
g=get(handles.checkbox19,'value');
if g==1
    set(handles.pushbutton24,'string','Run HTS');
    cou=cou+1;
end
g=get(handles.checkbox20,'value');
if g==1
    set(handles.pushbutton24,'string','Run FOA');
    cou=cou+1;
end
g=get(handles.checkbox21,'value');
if g==1
    set(handles.pushbutton24,'string','Run DSOS');
    cou=cou+1;
end
g=get(handles.checkbox22,'value');
if g==1
    set(handles.pushbutton24,'string','Run CUK');
    cou=cou+1;
end
if cou>1
    set(handles.pushbutton24,'string','Batch runing');
end
set(handles.pushbutton24,'enable','on');
if cou==0
    set(handles.pushbutton24,'enable','off');
    set(handles.pushbutton24,'string','not selected');
end
g=get(handles.checkbox13,'value');
if g==1
   Lcapara;
end


% --- Executes on button press in checkbox14.
function checkbox14_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox14
cou=0;
g=get(handles.checkbox12,'value');
if g==1
    set(handles.pushbutton24,'string','Run WCC');
    cou=cou+1;
end
g=get(handles.checkbox13,'value');
if g==1
    set(handles.pushbutton24,'string','Run LCA');
    cou=cou+1;
end
g=get(handles.checkbox14,'value');
if g==1
    set(handles.pushbutton24,'string','Run GA');
    cou=cou+1;
end
g=get(handles.checkbox15,'value');
if g==1
    set(handles.pushbutton24,'string','Run PSO');
    cou=cou+1;
end
g=get(handles.checkbox16,'value');
if g==1
    set(handles.pushbutton24,'string','Run ACO');
    cou=cou+1;
end
g=get(handles.checkbox17,'value');
if g==1
    set(handles.pushbutton24,'string','Run ICA');
    cou=cou+1;
end
g=get(handles.checkbox18,'value');
if g==1
    set(handles.pushbutton24,'string','Run LA');
    cou=cou+1;
end
g=get(handles.checkbox19,'value');
if g==1
    set(handles.pushbutton24,'string','Run HTS');
    cou=cou+1;
end
g=get(handles.checkbox20,'value');
if g==1
    set(handles.pushbutton24,'string','Run FOA');
    cou=cou+1;
end
g=get(handles.checkbox21,'value');
if g==1
    set(handles.pushbutton24,'string','Run DSOS');
    cou=cou+1;
end
g=get(handles.checkbox22,'value');
if g==1
    set(handles.pushbutton24,'string','Run CUK');
    cou=cou+1;
end
if cou>1
    set(handles.pushbutton24,'string','Batch runing');
end
set(handles.pushbutton24,'enable','on');
if cou==0
    set(handles.pushbutton24,'enable','off');
    set(handles.pushbutton24,'string','not selected');
end
g=get(handles.checkbox14,'value');
if g==1
   Gapara;
end


% --- Executes on button press in checkbox15.
function checkbox15_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox15
cou=0;
g=get(handles.checkbox12,'value');
if g==1
    set(handles.pushbutton24,'string','Run WCC');
    cou=cou+1;
end
g=get(handles.checkbox13,'value');
if g==1
    set(handles.pushbutton24,'string','Run LCA');
    cou=cou+1;
end
g=get(handles.checkbox14,'value');
if g==1
    set(handles.pushbutton24,'string','Run GA');
    cou=cou+1;
end
g=get(handles.checkbox15,'value');
if g==1
    set(handles.pushbutton24,'string','Run PSO');
    cou=cou+1;
end
g=get(handles.checkbox16,'value');
if g==1
    set(handles.pushbutton24,'string','Run ACO');
    cou=cou+1;
end
g=get(handles.checkbox17,'value');
if g==1
    set(handles.pushbutton24,'string','Run ICA');
    cou=cou+1;
end
g=get(handles.checkbox18,'value');
if g==1
    set(handles.pushbutton24,'string','Run LA');
    cou=cou+1;
end
g=get(handles.checkbox19,'value');
if g==1
    set(handles.pushbutton24,'string','Run HTS');
    cou=cou+1;
end
g=get(handles.checkbox20,'value');
if g==1
    set(handles.pushbutton24,'string','Run FOA');
    cou=cou+1;
end
g=get(handles.checkbox21,'value');
if g==1
    set(handles.pushbutton24,'string','Run DSOS');
    cou=cou+1;
end
g=get(handles.checkbox22,'value');
if g==1
    set(handles.pushbutton24,'string','Run CUK');
    cou=cou+1;
end
if cou>1
    set(handles.pushbutton24,'string','Batch runing');
end
set(handles.pushbutton24,'enable','on');
if cou==0
    set(handles.pushbutton24,'enable','off');
    set(handles.pushbutton24,'string','not selected');
end
g=get(handles.checkbox15,'value');
if g==1
   Psopara;
end


% --- Executes on button press in checkbox16.
function checkbox16_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox16
cou=0;
g=get(handles.checkbox12,'value');
if g==1
    set(handles.pushbutton24,'string','Run WCC');
    cou=cou+1;
end
g=get(handles.checkbox13,'value');
if g==1
    set(handles.pushbutton24,'string','Run LCA');
    cou=cou+1;
end
g=get(handles.checkbox14,'value');
if g==1
    set(handles.pushbutton24,'string','Run GA');
    cou=cou+1;
end
g=get(handles.checkbox15,'value');
if g==1
    set(handles.pushbutton24,'string','Run PSO');
    cou=cou+1;
end
g=get(handles.checkbox16,'value');
if g==1
    set(handles.pushbutton24,'string','Run ACO');
    cou=cou+1;
end
g=get(handles.checkbox17,'value');
if g==1
    set(handles.pushbutton24,'string','Run ICA');
    cou=cou+1;
end
g=get(handles.checkbox18,'value');
if g==1
    set(handles.pushbutton24,'string','Run LA');
    cou=cou+1;
end
g=get(handles.checkbox19,'value');
if g==1
    set(handles.pushbutton24,'string','Run HTS');
    cou=cou+1;
end
g=get(handles.checkbox20,'value');
if g==1
    set(handles.pushbutton24,'string','Run FOA');
    cou=cou+1;
end
g=get(handles.checkbox21,'value');
if g==1
    set(handles.pushbutton24,'string','Run DSOS');
    cou=cou+1;
end
g=get(handles.checkbox22,'value');
if g==1
    set(handles.pushbutton24,'string','Run CUK');
    cou=cou+1;
end
if cou>1
    set(handles.pushbutton24,'string','Batch runing');
end
set(handles.pushbutton24,'enable','on');
if cou==0
    set(handles.pushbutton24,'enable','off');
    set(handles.pushbutton24,'string','not selected');
end
g=get(handles.checkbox16,'value');
if g==1
   Acopara;
end


% --- Executes on button press in checkbox17.
function checkbox17_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox17
cou=0;
g=get(handles.checkbox12,'value');
if g==1
    set(handles.pushbutton24,'string','Run WCC');
    cou=cou+1;
end
g=get(handles.checkbox13,'value');
if g==1
    set(handles.pushbutton24,'string','Run LCA');
    cou=cou+1;
end
g=get(handles.checkbox14,'value');
if g==1
    set(handles.pushbutton24,'string','Run GA');
    cou=cou+1;
end
g=get(handles.checkbox15,'value');
if g==1
    set(handles.pushbutton24,'string','Run PSO');
    cou=cou+1;
end
g=get(handles.checkbox16,'value');
if g==1
    set(handles.pushbutton24,'string','Run ACO');
    cou=cou+1;
end
g=get(handles.checkbox17,'value');
if g==1
    set(handles.pushbutton24,'string','Run ICA');
    cou=cou+1;
end
g=get(handles.checkbox18,'value');
if g==1
    set(handles.pushbutton24,'string','Run LA');
    cou=cou+1;
end
g=get(handles.checkbox19,'value');
if g==1
    set(handles.pushbutton24,'string','Run HTS');
    cou=cou+1;
end
g=get(handles.checkbox20,'value');
if g==1
    set(handles.pushbutton24,'string','Run FOA');
    cou=cou+1;
end
g=get(handles.checkbox21,'value');
if g==1
    set(handles.pushbutton24,'string','Run DSOS');
    cou=cou+1;
end
g=get(handles.checkbox22,'value');
if g==1
    set(handles.pushbutton24,'string','Run CUK');
    cou=cou+1;
end
if cou>1
    set(handles.pushbutton24,'string','Batch runing');
end
set(handles.pushbutton24,'enable','on');
if cou==0
    set(handles.pushbutton24,'enable','off');
    set(handles.pushbutton24,'string','not selected');
end
g=get(handles.checkbox17,'value');
if g==1
   Icapara;
end


% --- Executes on button press in checkbox18.
function checkbox18_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox18
cou=0;
g=get(handles.checkbox12,'value');
if g==1
    set(handles.pushbutton24,'string','Run WCC');
    cou=cou+1;
end
g=get(handles.checkbox13,'value');
if g==1
    set(handles.pushbutton24,'string','Run LCA');
    cou=cou+1;
end
g=get(handles.checkbox14,'value');
if g==1
    set(handles.pushbutton24,'string','Run GA');
    cou=cou+1;
end
g=get(handles.checkbox15,'value');
if g==1
    set(handles.pushbutton24,'string','Run PSO');
    cou=cou+1;
end
g=get(handles.checkbox16,'value');
if g==1
    set(handles.pushbutton24,'string','Run ACO');
    cou=cou+1;
end
g=get(handles.checkbox17,'value');
if g==1
    set(handles.pushbutton24,'string','Run ICA');
    cou=cou+1;
end
g=get(handles.checkbox18,'value');
if g==1
    set(handles.pushbutton24,'string','Run LA');
    cou=cou+1;
end
g=get(handles.checkbox19,'value');
if g==1
    set(handles.pushbutton24,'string','Run HTS');
    cou=cou+1;
end
g=get(handles.checkbox20,'value');
if g==1
    set(handles.pushbutton24,'string','Run FOA');
    cou=cou+1;
end
g=get(handles.checkbox21,'value');
if g==1
    set(handles.pushbutton24,'string','Run DSOS');
    cou=cou+1;
end
g=get(handles.checkbox22,'value');
if g==1
    set(handles.pushbutton24,'string','Run CUK');
    cou=cou+1;
end
if cou>1
    set(handles.pushbutton24,'string','Batch runing');
end
set(handles.pushbutton24,'enable','on');
if cou==0
    set(handles.pushbutton24,'enable','off');
    set(handles.pushbutton24,'string','not selected');
end
g=get(handles.checkbox18,'value');
if g==1
   Lapara;
end


% --- Executes on button press in checkbox19.
function checkbox19_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox19
cou=0;
g=get(handles.checkbox12,'value');
if g==1
    set(handles.pushbutton24,'string','Run WCC');
    cou=cou+1;
end
g=get(handles.checkbox13,'value');
if g==1
    set(handles.pushbutton24,'string','Run LCA');
    cou=cou+1;
end
g=get(handles.checkbox14,'value');
if g==1
    set(handles.pushbutton24,'string','Run GA');
    cou=cou+1;
end
g=get(handles.checkbox15,'value');
if g==1
    set(handles.pushbutton24,'string','Run PSO');
    cou=cou+1;
end
g=get(handles.checkbox16,'value');
if g==1
    set(handles.pushbutton24,'string','Run ACO');
    cou=cou+1;
end
g=get(handles.checkbox17,'value');
if g==1
    set(handles.pushbutton24,'string','Run ICA');
    cou=cou+1;
end
g=get(handles.checkbox18,'value');
if g==1
    set(handles.pushbutton24,'string','Run LA');
    cou=cou+1;
end
g=get(handles.checkbox19,'value');
if g==1
    set(handles.pushbutton24,'string','Run HTS');
    cou=cou+1;
end
g=get(handles.checkbox20,'value');
if g==1
    set(handles.pushbutton24,'string','Run FOA');
    cou=cou+1;
end
g=get(handles.checkbox21,'value');
if g==1
    set(handles.pushbutton24,'string','Run DSOS');
    cou=cou+1;
end
g=get(handles.checkbox22,'value');
if g==1
    set(handles.pushbutton24,'string','Run CUK');
    cou=cou+1;
end
if cou>1
    set(handles.pushbutton24,'string','Batch runing');
end
set(handles.pushbutton24,'enable','on');
if cou==0
    set(handles.pushbutton24,'enable','off');
    set(handles.pushbutton24,'string','not selected');
end
g=get(handles.checkbox19,'value');
if g==1
   Htspara;
end


% --- Executes on button press in checkbox20.
function checkbox20_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox20
cou=0;
g=get(handles.checkbox12,'value');
if g==1
    set(handles.pushbutton24,'string','Run WCC');
    cou=cou+1;
end
g=get(handles.checkbox13,'value');
if g==1
    set(handles.pushbutton24,'string','Run LCA');
    cou=cou+1;
end
g=get(handles.checkbox14,'value');
if g==1
    set(handles.pushbutton24,'string','Run GA');
    cou=cou+1;
end
g=get(handles.checkbox15,'value');
if g==1
    set(handles.pushbutton24,'string','Run PSO');
    cou=cou+1;
end
g=get(handles.checkbox16,'value');
if g==1
    set(handles.pushbutton24,'string','Run ACO');
    cou=cou+1;
end
g=get(handles.checkbox17,'value');
if g==1
    set(handles.pushbutton24,'string','Run ICA');
    cou=cou+1;
end
g=get(handles.checkbox18,'value');
if g==1
    set(handles.pushbutton24,'string','Run LA');
    cou=cou+1;
end
g=get(handles.checkbox19,'value');
if g==1
    set(handles.pushbutton24,'string','Run HTS');
    cou=cou+1;
end
g=get(handles.checkbox20,'value');
if g==1
    set(handles.pushbutton24,'string','Run FOA');
    cou=cou+1;
end
g=get(handles.checkbox21,'value');
if g==1
    set(handles.pushbutton24,'string','Run DSOS');
    cou=cou+1;
end
g=get(handles.checkbox22,'value');
if g==1
    set(handles.pushbutton24,'string','Run CUK');
    cou=cou+1;
end
if cou>1
    set(handles.pushbutton24,'string','Batch runing');
end
set(handles.pushbutton24,'enable','on');
if cou==0
    set(handles.pushbutton24,'enable','off');
    set(handles.pushbutton24,'string','not selected');
end
g=get(handles.checkbox20,'value');
if g==1
   Foapara;
end


% --- Executes on button press in checkbox21.
function checkbox21_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox21
cou=0;
g=get(handles.checkbox12,'value');
if g==1
    set(handles.pushbutton24,'string','Run WCC');
    cou=cou+1;
end
g=get(handles.checkbox13,'value');
if g==1
    set(handles.pushbutton24,'string','Run LCA');
    cou=cou+1;
end
g=get(handles.checkbox14,'value');
if g==1
    set(handles.pushbutton24,'string','Run GA');
    cou=cou+1;
end
g=get(handles.checkbox15,'value');
if g==1
    set(handles.pushbutton24,'string','Run PSO');
    cou=cou+1;
end
g=get(handles.checkbox16,'value');
if g==1
    set(handles.pushbutton24,'string','Run ACO');
    cou=cou+1;
end
g=get(handles.checkbox17,'value');
if g==1
    set(handles.pushbutton24,'string','Run ICA');
    cou=cou+1;
end
g=get(handles.checkbox18,'value');
if g==1
    set(handles.pushbutton24,'string','Run LA');
    cou=cou+1;
end
g=get(handles.checkbox19,'value');
if g==1
    set(handles.pushbutton24,'string','Run HTS');
    cou=cou+1;
end
g=get(handles.checkbox20,'value');
if g==1
    set(handles.pushbutton24,'string','Run FOA');
    cou=cou+1;
end
g=get(handles.checkbox21,'value');
if g==1
    set(handles.pushbutton24,'string','Run DSOS');
    cou=cou+1;
end
g=get(handles.checkbox22,'value');
if g==1
    set(handles.pushbutton24,'string','Run CUK');
    cou=cou+1;
end
if cou>1
    set(handles.pushbutton24,'string','Batch runing');
end
set(handles.pushbutton24,'enable','on');
if cou==0
    set(handles.pushbutton24,'enable','off');
    set(handles.pushbutton24,'string','not selected');
end
g=get(handles.checkbox21,'value');
if g==1
   Dsospara;
end


% --- Executes on button press in checkbox22.
function checkbox22_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox22
cou=0;
g=get(handles.checkbox12,'value');
if g==1
    set(handles.pushbutton24,'string','Run WCC');
    cou=cou+1;
end
g=get(handles.checkbox13,'value');
if g==1
    set(handles.pushbutton24,'string','Run LCA');
    cou=cou+1;
end
g=get(handles.checkbox14,'value');
if g==1
    set(handles.pushbutton24,'string','Run GA');
    cou=cou+1;
end
g=get(handles.checkbox15,'value');
if g==1
    set(handles.pushbutton24,'string','Run PSO');
    cou=cou+1;
end
g=get(handles.checkbox16,'value');
if g==1
    set(handles.pushbutton24,'string','Run ACO');
    cou=cou+1;
end
g=get(handles.checkbox17,'value');
if g==1
    set(handles.pushbutton24,'string','Run ICA');
    cou=cou+1;
end
g=get(handles.checkbox18,'value');
if g==1
    set(handles.pushbutton24,'string','Run LA');
    cou=cou+1;
end
g=get(handles.checkbox19,'value');
if g==1
    set(handles.pushbutton24,'string','Run HTS');
    cou=cou+1;
end
g=get(handles.checkbox20,'value');
if g==1
    set(handles.pushbutton24,'string','Run FOA');
    cou=cou+1;
end
g=get(handles.checkbox21,'value');
if g==1
    set(handles.pushbutton24,'string','Run DSOS');
    cou=cou+1;
end
g=get(handles.checkbox22,'value');
if g==1
    set(handles.pushbutton24,'string','Run CUK');
    cou=cou+1;
end
if cou>1
    set(handles.pushbutton24,'string','Batch runing');
end
set(handles.pushbutton24,'enable','on');
if cou==0
    set(handles.pushbutton24,'enable','off');
    set(handles.pushbutton24,'string','not selected');
end
g=get(handles.checkbox22,'value');
if g==1
   Cukpara;
end



function edit75_Callback(hObject, eventdata, handles)
% hObject    handle to edit75 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit75 as text
%        str2double(get(hObject,'String')) returns contents of edit75 as a double


% --- Executes during object creation, after setting all properties.
function edit75_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit75 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NOF=[];
ET=[];
ER=[];
ER_STD=[];
ER_L_CI=[];
ER_H_CI=[];
ER_P=[];
ER_TS=[];
CR=[];
CR_STD=[];
CR_L_CI=[];
CR_H_CI=[];
CR_P=[];
CR_TS=[];
alname=[];

global besten;
besten=[];

global fwcc;
global flca;
global fga;
global fpso;
global faco;
global fica;
global ffoa;
global fhts;
global fdsos;
global fcuk;
global fla;
fwcc=[];
fla=[];
fcuk=[];
fpso=[];
faco=[];
flca=[];
fica=[];
fdsos=[];
fhts=[];
ffoa=[];
fga=[];

global wcck;
global lcak;
global gak;
global psok;
global acok;
global icak;
global foak;
global htsk;
global dsosk;
global cukk;
global lak;
wcck=[];
lak=[];
cukk=[];
psok=[];
acok=[];
lcak=[];
icak=[];
dsosk=[];
htsk=[];
foak=[];
gak=[];

ind=get(handles.popupmenu3,'value');
if ind==2
    y_label='Accuracy';
end
if ind==3
    y_label='Sensitivity';
end
if ind==4
    y_label='Specificity';
end
if ind==5
    y_label='Precision';
end
global hamwcc;
global hamawcc;
global hamcwcc;
global hamcawcc;
global pwcc;
global pcwcc;
global wccf;
global wcct;
global wccc;
wcct=[];
wccf=[];
wccc=[];
pwcc=[];
pcwcc=[];

global hamlca;
global hamalca;
global hamclca;
global hamcalca;
global plca;
global pclca;
global lcaf;
global lcat;
global lcac;
lcat=[];
lcaf=[];
lcac=[];
plca=[];
pclca=[];

global hamga;
global hamaga;
global hamcga;
global hamcaga;
global pga;
global pcga;
global gaf;
global gat;
global gac;
gat=[];
gaf=[];
gac=[];
pga=[];
pcga=[];

global hampso;
global hamapso;
global hamcpso;
global hamcapso;
global ppso;
global pcpso;
global psof;
global psot;
global psoc;
psot=[];
psof=[];
psoc=[];
ppso=[];
pcpso=[];

global hamaco;
global hamaaco;
global hamcaco;
global hamcaaco;
global paco;
global pcaco;
global acof;
global acot;
global acoc;
acot=[];
acof=[];
acoc=[];
paco=[];
pcaco=[];

global hamica;
global hamaica;
global hamcica;
global hamcaica;
global pica;
global pcica;
global icaf;
global icat;
global icac;
icat=[];
icaf=[];
icac=[];
pica=[];
pcica=[];

global hamla;
global hamala;
global hamcla;
global hamcala;
global pla;
global pcla;
global laf;
global lat;
global lac;
lat=[];
laf=[];
lac=[];
pla=[];
pcla=[];

global hamhts;
global hamahts;
global hamchts;
global hamcahts;
global phts;
global pchts;
global htsf;
global htst;
global htsc;
htst=[];
htsf=[];
htsc=[];
phts=[];
pchts=[];

global hamfoa;
global hamafoa;
global hamcfoa;
global hamcafoa;
global pfoa;
global pcfoa;
global foaf;
global foat;
global foac;
foat=[];
foaf=[];
foac=[];
pfoa=[];
pcfoa=[];

global hamdsos;
global hamadsos;
global hamcdsos;
global hamcadsos;
global pdsos;
global pcdsos;
global dsosf;
global dsost;
global dsosc;
dsost=[];
dsosf=[];
dsosc=[];
pdsos=[];
pcdsos=[];

global hamcuk;
global hamacuk;
global hamccuk;
global hamcacuk;
global pcuk;
global pccuk;
global cukf;
global cukt;
global cukc;
cukt=[];
cukf=[];
cukc=[];
pcuk=[];
pccuk=[];

hamwcc=[];
hamlca=[];
hampso=[];
hamaco=[];
hamga=[];
hamfoa=[];
hamla=[];
hamica=[];
hamdsos=[];
hamhts=[];
hamcuk=[];
hamawcc=[];
hamalca=[];
hamapso=[];
hamaaco=[];
hamaga=[];
hamafoa=[];
hamala=[];
hamaica=[];
hamadsos=[];
hamahts=[];
hamacuk=[];

hwcc=[];
hawcc=[];
cwcc=[];
cawcc=[];

hlca=[];
halca=[];
clca=[];
calca=[];

hga=[];
haga=[];
cga=[];
caga=[];

hfoa=[];
hafoa=[];
cfoa=[];
cafoa=[];

hpso=[];
hapso=[];
cpso=[];
capso=[];

haco=[];
haaco=[];
caco=[];
caaco=[];

hhts=[];
hahts=[];
chts=[];
cahts=[];

hdsos=[];
hadsos=[];
cdsos=[];
cadsos=[];

hla=[];
hala=[];
cla=[];
cala=[];

hica=[];
haica=[];
cica=[];
caica=[];

hcuk=[];
hacuk=[];
ccuk=[];
cacuk=[];
global enum;
p=str2num(get(handles.edit76,'string'));
for i=1:max(p,2)
enum=i;
x=get(handles.checkbox12,'value');
if x==1
    pushbutton2_Callback(hObject, eventdata, handles);
    hwcc=[hwcc;hamwcc];
    hawcc=[hawcc;hamawcc];
    cwcc=[cwcc;hamcwcc];
    cawcc=[cawcc;hamcawcc];
end
x=get(handles.checkbox13,'value');
if x==1
    pushbutton4_Callback(hObject, eventdata, handles);
    hlca=[hlca;hamlca];
    halca=[halca;hamalca];
    clca=[clca;hamclca];
    calca=[calca;hamcalca];
end
x=get(handles.checkbox14,'value');
if x==1
    pushbutton5_Callback(hObject, eventdata, handles);
    hga=[hga;hamga];
    haga=[haga;hamaga];
    cga=[cga;hamcga];
    caga=[caga;hamcaga];
end
x=get(handles.checkbox15,'value');
if x==1
    pushbutton8_Callback(hObject, eventdata, handles);
    hpso=[hpso;hampso];
    hapso=[hapso;hamapso];
    cpso=[cpso;hamcpso];
    capso=[capso;hamcapso];
end
x=get(handles.checkbox16,'value');
if x==1 
    pushbutton9_Callback(hObject, eventdata, handles);
    haco=[haco;hamaco];
    haaco=[haaco;hamaaco];
    caco=[caco;hamcaco];
    caaco=[caaco;hamcaaco];
end
x=get(handles.checkbox17,'value');
if x==1
    pushbutton10_Callback(hObject, eventdata, handles);
    hica=[hica;hamica];
    haica=[haica;hamaica];
    cica=[cica;hamcica];
    caica=[caica;hamcaica];
end
x=get(handles.checkbox18,'value');
if x==1
    pushbutton11_Callback(hObject, eventdata, handles);
    hla=[hla;hamla];
    hala=[hala;hamala];
    cla=[cla;hamcla];
    cala=[cala;hamcala];
end
x=get(handles.checkbox19,'value');
if x==1
    pushbutton13_Callback(hObject, eventdata, handles);
    hhts=[hhts;hamhts];
    hahts=[hahts;hamahts];
    chts=[chts;hamchts];
    cahts=[cahts;hamcahts];
end
x=get(handles.checkbox20,'value');
if x==1
    pushbutton14_Callback(hObject, eventdata, handles);
    hfoa=[hfoa;hamfoa];
    hafoa=[hafoa;hamafoa];
    cfoa=[cfoa;hamcfoa];
    cafoa=[cafoa;hamcafoa];
end
x=get(handles.checkbox21,'value');
if x==1
    pushbutton15_Callback(hObject, eventdata, handles);
    hdsos=[hdsos;hamdsos];
    hadsos=[hadsos;hamadsos];
    cdsos=[cdsos;hamcdsos];
    cadsos=[cadsos;hamcadsos];
end
x=get(handles.checkbox22,'value');
if x==1
    pushbutton16_Callback(hObject, eventdata, handles);
    hcuk=[hcuk;hamcuk];
    hacuk=[hacuk;hamacuk];
    ccuk=[ccuk;hamccuk];
    cacuk=[cacuk;hamcacuk];
end
end
st1='The selcted algorithms were performed';
st1=cellstr(st1);
st2='The results are available in program directory';
st2=cellstr(st2);
ne = [st1;st2];
set(handles.listbox1,'String',ne);

f1=figure;
st='';
st=cellstr(st);
hold on;

[a,b]=size(hwcc);
if a>0
    s=1;
    mi=hwcc(1,b);
    for i=2:a
        if hwcc(i,b)<mi
            mi=hwcc(i,b);
            s=i;
        end
    end
    hamwcc=hwcc(s,:);
    hamawcc=hawcc(s,:);
    hamcwcc=cwcc(s,:);
    hamcawcc=cawcc(s,:);
    wcct=wcct(s,:);
    wccf=wccf(s,:);
    besten=wccf;
    wccc=wccc(s,:);
    fwcc=fwcc(s,:);
    wcck=wcck(s,:);
end

[a,b]=size(hlca);
if a>0
    s=1;
    mi=hlca(1,b);
    for i=2:a
        if hlca(i,b)<mi
            mi=hlca(i,b);
            s=i;
        end
    end
    hamlca=hlca(s,:);
    hamalca=halca(s,:);
    hamclca=clca(s,:);
    hamcalca=calca(s,:);
    lcat=lcat(s,:);
    lcaf=lcaf(s,:);
    besten=lcaf;
    lcac=lcac(s,:);
    flca=flca(s,:);
    lcak=lcak(s,:);
end

[a,b]=size(hga);
if a>0
    s=1;
    mi=hga(1,b);
    for i=2:a
        if hga(i,b)<mi
            mi=hga(i,b);
            s=i;
        end
    end
    hamga=hga(s,:);
    hamaga=haga(s,:);
    hamcga=cga(s,:);
    hamcaga=caga(s,:);
    gat=gat(s,:);
    gaf=gaf(s,:);
    besten=gaf;
    gac=gac(s,:);
    fga=fga(s,:);
    gak=gak(s,:);
end

[a,b]=size(hpso);
if a>0
    s=1;
    mi=hpso(1,b);
    for i=2:a
        if hpso(i,b)<mi
            mi=hpso(i,b);
            s=i;
        end
    end
    hampso=hpso(s,:);
    hamapso=hapso(s,:);
    hamcpso=cpso(s,:);
    hamcapso=capso(s,:);
    psot=psot(s,:);
    psof=psof(s,:);
    besten=psof;
    psoc=psoc(s,:);
    fpso=fpso(s,:);
    psok=psok(s,:);
end

[a,b]=size(haco);
if a>0
    s=1;
    mi=haco(1,b);
    for i=2:a
        if haco(i,b)<mi
            mi=haco(i,b);
            s=i;
        end
    end
    hamaco=haco(s,:);
    hamaaco=haaco(s,:);
    hamcaco=caco(s,:);
    hamcaaco=caaco(s,:);
    acot=acot(s,:);
    acof=acof(s,:);
    besten=acof;
    acoc=acoc(s,:);
    faco=faco(s,:);
    acok=acok(s,:);
end

[a,b]=size(hica);
if a>0
    s=1;
    mi=hica(1,b);
    for i=2:a
        if hica(i,b)<mi
            mi=hica(i,b);
            s=i;
        end
    end
    hamica=hica(s,:);
    hamaica=haica(s,:);
    hamcica=cica(s,:);
    hamcaica=caica(s,:);
    icat=icat(s,:);
    icaf=icaf(s,:);
    besten=icaf;
    icac=icac(s,:);
    fica=fica(s,:);
    icak=icak(s,:);
end

[a,b]=size(hla);
if a>0
    s=1;
    mi=hla(1,b);
    for i=2:a
        if hla(i,b)<mi
            mi=hla(i,b);
            s=i;
        end
    end
    hamla=hla(s,:);
    hamala=hala(s,:);
    hamcla=cla(s,:);
    hamcala=cala(s,:);
    lat=lat(s,:);
    laf=laf(s,:);
    besten=laf;
    lac=lac(s,:);
    fla=fla(s,:);
    lak=lak(s,:);
end

[a,b]=size(hhts);
if a>0
    s=1;
    mi=hhts(1,b);
    for i=2:a
        if hhts(i,b)<mi
            mi=hhts(i,b);
            s=i;
        end
    end
    hamhts=hhts(s,:);
    hamahts=hahts(s,:);
    hamchts=chts(s,:);
    hamcahts=cahts(s,:);
    htst=htst(s,:);
    htsf=htsf(s,:);
    besten=htsf;
    htsc=htsc(s,:);
    fhts=fhts(s,:);
    htsk=htsk(s,:);
end

[a,b]=size(hfoa);
if a>0
    s=1;
    mi=hfoa(1,b);
    for i=2:a
        if hfoa(i,b)<mi
            mi=hfoa(i,b);
            s=i;
        end
    end
    hamfoa=hfoa(s,:);
    hamafoa=hafoa(s,:);
    hamcfoa=cfoa(s,:);
    hamcafoa=cafoa(s,:);
    foat=foat(s,:);
    foaf=foaf(s,:);
    besten=foaf;
    foac=foac(s,:);
    ffoa=ffoa(s,:);
    foak=foak(s,:);
end

[a,b]=size(hdsos);
if a>0
    s=1;
    mi=hdsos(1,b);
    for i=2:a
        if hdsos(i,b)<mi
            mi=hdsos(i,b);
            s=i;
        end
    end
    hamdsos=hdsos(s,:);
    hamadsos=hadsos(s,:);
    hamcdsos=cdsos(s,:);
    hamcadsos=cadsos(s,:);
    dsost=dsost(s,:);
    dsosf=dsosf(s,:);
    besten=dsosf;
    dsosc=dsosc(s,:);
    fdsos=fdsos(s,:);
    dsosk=dsosk(s,:);
end

[a,b]=size(hcuk);
if a>0
    s=1;
    mi=hcuk(1,b);
    for i=2:a
        if hcuk(i,b)<mi
            mi=hcuk(i,b);
            s=i;
        end
    end
    hamcuk=hcuk(s,:);
    hamacuk=hacuk(s,:);
    hamccuk=ccuk(s,:);
    hamcacuk=cacuk(s,:);
    cukt=cukt(s,:);
    cukf=cukf(s,:);
    besten=cukf;
    cukc=cukc(s,:);
    fcuk=fcuk(s,:);
    cukk=cukk(s,:);
end

cr=get(handles.checkbox25,'value');
if cr==1
[v1,v2]=size(hamwcc);
if v1>0
hamwcc=hamwcc;
end
[v1,v2]=size(hamlca);
if v1>0
hamlca=hamlca;
end
[v1,v2]=size(hampso);
if v1>0
hampso=hampso;
end
[v1,v2]=size(hamaco);
if v1>0
hamaco=hamaco;
end
[v1,v2]=size(hamfoa);
if v1>0
hamfoa=hamfoa;
end
[v1,v2]=size(hamhts);
if v1>0
hamhts=hamhts;
end
[v1,v2]=size(hamdsos);
if v1>0
hamdsos=hamdsos;
end
[v1,v2]=size(hamla);
if v1>0
hamla=hamla;
end
[v1,v2]=size(hamga);
if v1>0
hamga=hamga;
end
[v1,v2]=size(hamcuk);
if v1>0
hamcuk=hamcuk;
end
[v1,v2]=size(hamica);
if v1>0
hamica=hamica;
end
[v1,v2]=size(hamawcc);
if v1>0
hamawcc=hamawcc;
end
[v1,v2]=size(hamalca);
if v1>0
hamalca=hamalca;
end
[v1,v2]=size(hamapso);
if v1>0
hamapso=hamapso;
end
[v1,v2]=size(hamaaco);
if v1>0
hamaaco=hamaaco;
end
[v1,v2]=size(hamafoa);
if v1>0
hamafoa=hamafoa;
end
[v1,v2]=size(hamahts);
if v1>0
hamahts=hamahts;
end
[v1,v2]=size(hamadsos);
if v1>0
hamadsos=hamadsos;
end
[v1,v2]=size(hamala);
if v1>0
hamala=hamala;
end
[v1,v2]=size(hamaga);
if v1>0
hamaga=hamaga;
end
[v1,v2]=size(hamacuk);
if v1>0
hamacuk=hamacuk;
end
[v1,v2]=size(hamaica);
if v1>0
hamaica=hamaica;
end
pwcc=pwcc;
plca=plca;
ppso=ppso;
paco=paco;
pfoa=pfoa;
phts=phts;
pdsos=pdsos;
pla=pla;
pga=pga;
pcuk=pcuk;
pica=pica;
else
[v1,v2]=(size(hamwcc));
if v1>0
hamwcc=-(hamwcc);
end
[v1,v2]=(size(hamlca));
if v1>0
hamlca=-(hamlca);
end
[v1,v2]=(size(hampso));
if v1>0
hampso=-(hampso);
end
[v1,v2]=(size(hamaco));
if v1>0
hamaco=-(hamaco);
end
[v1,v2]=(size(hamfoa));
if v1>0
hamfoa=-(hamfoa);
end
[v1,v2]=(size(hamhts));
if v1>0
hamhts=-(hamhts);
end
[v1,v2]=(size(hamdsos));
if v1>0
hamdsos=-(hamdsos);
end
[v1,v2]=(size(hamla));
if v1>0
hamla=-(hamla);
end
[v1,v2]=(size(hamga));
if v1>0
hamga=-(hamga);
end
[v1,v2]=(size(hamcuk));
if v1>0
hamcuk=-(hamcuk);
end
[v1,v2]=(size(hamica));
if v1>0
hamica=-(hamica);
end
[v1,v2]=(size(hamawcc));
if v1>0
hamawcc=-(hamawcc);
end
[v1,v2]=(size(hamalca));
if v1>0
hamalca=-(hamalca);
end
[v1,v2]=(size(hamapso));
if v1>0
hamapso=-(hamapso);
end
[v1,v2]=(size(hamaaco));
if v1>0
hamaaco=-(hamaaco);
end
[v1,v2]=(size(hamafoa));
if v1>0
hamafoa=-(hamafoa);
end
[v1,v2]=(size(hamahts));
if v1>0
hamahts=-(hamahts);
end
[v1,v2]=(size(hamadsos));
if v1>0
hamadsos=-(hamadsos);
end
[v1,v2]=(size(hamala));
if v1>0
hamala=-(hamala);
end
[v1,v2]=(size(hamaga));
if v1>0
hamaga=-(hamaga);
end
[v1,v2]=(size(hamacuk));
if v1>0
hamacuk=-(hamacuk);
end
[v1,v2]=(size(hamaica));
if v1>0
hamaica=-(hamaica);
end
pwcc= -pwcc;
plca= -plca;
ppso= -ppso;
paco= -paco;
pfoa= -pfoa;
phts= -phts;
pdsos= -pdsos;
pla= -pla;
pga= -pga;
pcuk= -pcuk;
pica= -pica;
end

res=[];
res='This application has been developed in laboratory of systems biology and bioinformatics (LBB)';
res=cellstr(res);
dline='---------------------------------------------------------------------------------------------';
dline=cellstr(dline);
res=[dline;res];
res=[dline;res];
res=[res;dline];
res=[res;dline];
x=get(handles.checkbox12,'value');
cr=get(handles.checkbox25,'value');
if x==1
   alname=[alname;'WCC']; 
   alname=cellstr(alname);
   st=[st,'WCC'];
   res=[res;'Algorithm name : WCC'];
   res=[res;strcat('Number of selected features : ',wccc)];
   res=[res;'The selected feature indices are :'];
   res=[res;(wccf)];
   
   res=[res;strcat('Elapsed time per one time run based on seconds:',wcct)];
   if cr==1
      res=[res;'The convergence values of RMSEare:'];
   else
      res=[res;'The convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamwcc)];
   if cr==1
      res=[res;'The average convergence values of RMSEare:'];
   else
      res=[res;'The average convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamawcc)];
   [h,pv,ci,stats]=ttest(pwcc);
   if cr==1
      res=[res;'The stability values of RMSEare:'];
   else
      res=[res;'The stability values of ',y_label,' are:']; 
   end
   res=[res;num2str(pwcc)];
   if cr==1
      res=[res;strcat('p-value of RMSE:',num2str(pv))];
   else
       res=[res;strcat('p-value of ',y_label,' :',num2str(pv))];
   end
   if cr==1
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of ',y_label,' :',num2str(ci))];
   end
   if cr==1
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for ',y_label,':',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for ',y_label,':',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated population standard deviation for error:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated population standard deviation for ',y_label,':',num2str(stats.sd))]; 
   end
   NOF=[NOF;wccc];
   ET=[ET;wcct];
   [a,b]=size(hamwcc);
   ER=[ER;hamwcc(a,b)];
   ER_STD=[ER_STD;(stats.sd)];
   ER_L_CI=[ER_L_CI;(ci(1,1))];
   ER_H_CI=[ER_H_CI;(ci(1,2))];
   ER_P=[ER_P;pv];
   ER_TS=[ER_TS;stats.tstat];
   if cr==1
      res=[res;'The convergence values of correlation are:'];
   else
      res=[res;'The convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamcwcc)];
   if cr==1
      res=[res;'The average convergence values of correlation are:'];
   else
      res=[res;'The average convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamcawcc)];
   [h,pv,ci,stats]=ttest(pcwcc);
   if cr==1
      res=[res;'The stability values of correlation are:'];
   else
      res=[res;'The stability values of RMSEare:']; 
   end
   res=[res;num2str(pcwcc)];
   if cr==1
      res=[res;strcat('p-value of correlation :',num2str(pv))];
   else
      res=[res;strcat('p-value of RMSE:',num2str(pv))]; 
   end
   if cr==1
      res=[res;strcat('Confidence interval of correlation :',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))]; 
   end
   if cr==1
      res=[res;strcat('The value of the test static for correlation:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for correlation:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated population standard deviation for correlation:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated population standard deviation for error:',num2str(stats.sd))];
   end
   res=[res;dline];
   [a,b]=size(hamcwcc);
   CR=[CR;hamcwcc(a,b)];
   CR_STD=[CR_STD;(stats.sd)];
   CR_L_CI=[CR_L_CI;(ci(1,1))];
   CR_H_CI=[CR_H_CI;(ci(1,2))];
   CR_P=[CR_P;pv];
   CR_TS=[CR_TS;stats.tstat];
   [a,b]=size(hamwcc);
   subplot(2,3,1),plot(a:b,hamwcc,'-d','linewidth',1);
   hold on;
   subplot(2,3,2),plot(a:b,hamawcc,'-d','linewidth',1);
   hold on;
   subplot(2,3,3),plot(1:p,pwcc,'-d','linewidth',1);
   hold on;
   subplot(2,3,4),plot(a:b,hamcwcc,'-d','linewidth',1);
   hold on;
   subplot(2,3,5),plot(a:b,hamcawcc,'-d','linewidth',1);
   hold on;
   subplot(2,3,6),plot(1:p,pcwcc,'-d','linewidth',1);
   hold on;
end

x=get(handles.checkbox13,'value');
if x==1
    alname=[alname;'LCA'];
    alname=cellstr(alname);
   st=[st,'LCA'];
   res=[res;'Algorithm name : LCA'];
   res=[res;strcat('Number of selected features : ',lcac)];
   res=[res;'The selected feature indices are :'];
   res=[res;(lcaf)];
   res=[res;strcat('Elapsed time per one time run based on seconds:',lcat)];
   if cr==1
      res=[res;'The convergence values of RMSEare:'];
   else
      res=[res;'The convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamlca)];
   if cr==1
      res=[res;'The average convergence values of RMSEare:'];
   else
      res=[res;'The average convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamalca)];
   [h,pv,ci,stats]=ttest(plca);
   if cr==1
      res=[res;'The stability values of RMSEare:'];
   else
      res=[res;'The stability values of ',y_label,' are:']; 
   end
   res=[res;num2str(plca)];
   if cr==1
      res=[res;strcat('p-value of RMSE:',num2str(pv))];
   else
       res=[res;strcat('p-value of ',y_label,' :',num2str(pv))];
   end
   if cr==1
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of ',y_label,' :',num2str(ci))];
   end
   if cr==1
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for ',y_label,':',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for ',y_label,':',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated population standard deviation for error:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated population standard deviation for ',y_label,':',num2str(stats.sd))]; 
   end
   NOF=[NOF;lcac];
   ET=[ET;lcat];
   [a,b]=size(hamlca);
   ER=[ER;hamlca(a,b)];
   ER_STD=[ER_STD;(stats.sd)];
   ER_L_CI=[ER_L_CI;(ci(1,1))];
   ER_H_CI=[ER_H_CI;(ci(1,2))];
   ER_P=[ER_P;pv];
   ER_TS=[ER_TS;stats.tstat];
    if cr==1
      res=[res;'The convergence values of correlation are:'];
   else
      res=[res;'The convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamclca)];
   if cr==1
      res=[res;'The average convergence values of correlation are:'];
   else
      res=[res;'The average convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamcalca)];
   [h,pv,ci,stats]=ttest(pclca);
   if cr==1
      res=[res;'The stability values of correlation are:'];
   else
      res=[res;'The stability values of RMSEare:']; 
   end
   res=[res;num2str(pclca)];
   if cr==1
      res=[res;strcat('p-value of correlation :',num2str(pv))];
   else
      res=[res;strcat('p-value of RMSE:',num2str(pv))]; 
   end
   if cr==1
      res=[res;strcat('Confidence interval of correlation :',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))]; 
   end
   if cr==1
      res=[res;strcat('The value of the test static for correlation:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for correlation:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated population standard deviation for correlation:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated population standard deviation for error:',num2str(stats.sd))];
   end
   res=[res;dline];
   [a,b]=size(hamclca);
   CR=[CR;hamclca(a,b)];
   CR_STD=[CR_STD;(stats.sd)];
   CR_L_CI=[CR_L_CI;(ci(1,1))];
   CR_H_CI=[CR_H_CI;(ci(1,2))];
   CR_P=[CR_P;pv];
   CR_TS=[CR_TS;stats.tstat];
   [a,b]=size(hamlca);
   subplot(2,3,1),plot(a:b,hamlca,'-o','linewidth',1);
   hold on;
   subplot(2,3,2),plot(a:b,hamalca,'-o','linewidth',1);
   hold on;
   subplot(2,3,3),plot(1:p,plca,'-o','linewidth',1);
   hold on;
   subplot(2,3,4),plot(a:b,hamclca,'-o','linewidth',1);
   hold on;
   subplot(2,3,5),plot(a:b,hamcalca,'-o','linewidth',1);
   hold on;
   subplot(2,3,6),plot(1:p,pclca,'-o','linewidth',1);
   hold on;
end

x=get(handles.checkbox14,'value');
if x==1
    alname=[alname;'GA'];
    alname=cellstr(alname);
   st=[st,'GA'];
   res=[res;'Algorithm name : GA'];
   res=[res;strcat('Number of selected features : ',gac)];
   res=[res;'The selected feature indices are :'];
   res=[res;(gaf)];
   res=[res;strcat('Elapsed time per one time run based on seconds:',gat)];
   if cr==1
      res=[res;'The convergence values of RMSEare:'];
   else
      res=[res;'The convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamga)];
   if cr==1
      res=[res;'The average convergence values of RMSEare:'];
   else
      res=[res;'The average convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamaga)];
   [h,pv,ci,stats]=ttest(pga);
   if cr==1
      res=[res;'The stability values of RMSEare:'];
   else
      res=[res;'The stability values of ',y_label,' are:']; 
   end
   res=[res;num2str(pga)];
   if cr==1
      res=[res;strcat('p-value of RMSE:',num2str(pv))];
   else
       res=[res;strcat('p-value of ',y_label,' :',num2str(pv))];
   end
   if cr==1
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of ',y_label,' :',num2str(ci))];
   end
   if cr==1
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for ',y_label,':',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for ',y_label,':',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated population standard deviation for error:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated population standard deviation for ',y_label,':',num2str(stats.sd))]; 
   end
   NOF=[NOF;gac];
   ET=[ET;gat];
   [a,b]=size(hamga);
   ER=[ER;hamga(a,b)];
   ER_STD=[ER_STD;(stats.sd)];
   ER_L_CI=[ER_L_CI;(ci(1,1))];
   ER_H_CI=[ER_H_CI;(ci(1,2))];
   ER_P=[ER_P;pv];
   ER_TS=[ER_TS;stats.tstat];
    if cr==1
      res=[res;'The convergence values of correlation are:'];
   else
      res=[res;'The convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamcga)];
   if cr==1
      res=[res;'The average convergence values of correlation are:'];
   else
      res=[res;'The average convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamcaga)];
   [h,pv,ci,stats]=ttest(pcga);
   if cr==1
      res=[res;'The stability values of correlation are:'];
   else
      res=[res;'The stability values of RMSEare:']; 
   end
   res=[res;num2str(pcga)];
   if cr==1
      res=[res;strcat('p-value of correlation :',num2str(pv))];
   else
      res=[res;strcat('p-value of RMSE:',num2str(pv))]; 
   end
   if cr==1
      res=[res;strcat('Confidence interval of correlation :',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))]; 
   end
   if cr==1
      res=[res;strcat('The value of the test static for correlation:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for correlation:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated population standard deviation for correlation:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated population standard deviation for error:',num2str(stats.sd))];
   end
   res=[res;dline];
   [a,b]=size(hamcga);
   CR=[CR;hamcga(a,b)];
   CR_STD=[CR_STD;(stats.sd)];
   CR_L_CI=[CR_L_CI;(ci(1,1))];
   CR_H_CI=[CR_H_CI;(ci(1,2))];
   CR_P=[CR_P;pv];
   CR_TS=[CR_TS;stats.tstat];
   [a,b]=size(hamga);
   subplot(2,3,1),plot(a:b,hamga,'-x','linewidth',1);
   hold on;
   subplot(2,3,2),plot(a:b,hamaga,'-x','linewidth',1);
   hold on;
   subplot(2,3,3),plot(1:p,pga,'-x','linewidth',1);
   hold on;
   subplot(2,3,4),plot(a:b,hamcga,'-x','linewidth',1);
   hold on;
   subplot(2,3,5),plot(a:b,hamcaga,'-x','linewidth',1);
   hold on;
   subplot(2,3,6),plot(1:p,pcga,'-x','linewidth',1);
   hold on;
end

x=get(handles.checkbox15,'value');
if x==1 
    alname=[alname;'PSO'];
    alname=cellstr(alname);
   st=[st,'PSO'];
   res=[res;'Algorithm name : PSO'];
   res=[res;strcat('Number of selected features : ',psoc)];
   res=[res;'The selected feature indices are :'];
   res=[res;(psof)];
   res=[res;strcat('Elapsed time per one time run based on seconds:',psot)];
   if cr==1
      res=[res;'The convergence values of RMSEare:'];
   else
      res=[res;'The convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hampso)];
   if cr==1
      res=[res;'The average convergence values of RMSEare:'];
   else
      res=[res;'The average convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamapso)];
   [h,pv,ci,stats]=ttest(ppso);
   if cr==1
      res=[res;'The stability values of RMSEare:'];
   else
      res=[res;'The stability values of ',y_label,' are:']; 
   end
   res=[res;num2str(ppso)];
   if cr==1
      res=[res;strcat('p-value of RMSE:',num2str(pv))];
   else
       res=[res;strcat('p-value of ',y_label,' :',num2str(pv))];
   end
   if cr==1
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of ',y_label,' :',num2str(ci))];
   end
   if cr==1
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for ',y_label,':',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for ',y_label,':',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated population standard deviation for error:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated population standard deviation for ',y_label,':',num2str(stats.sd))]; 
   end
   NOF=[NOF;psoc];
   ET=[ET;psot];
   [a,b]=size(hampso);
   ER=[ER;hampso(a,b)];
   ER_STD=[ER_STD;(stats.sd)];
   ER_L_CI=[ER_L_CI;(ci(1,1))];
   ER_H_CI=[ER_H_CI;(ci(1,2))];
   ER_P=[ER_P;pv];
   ER_TS=[ER_TS;stats.tstat];
    if cr==1
      res=[res;'The convergence values of correlation are:'];
   else
      res=[res;'The convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamcpso)];
   if cr==1
      res=[res;'The average convergence values of correlation are:'];
   else
      res=[res;'The average convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamcapso)];
   [h,pv,ci,stats]=ttest(pcpso);
   if cr==1
      res=[res;'The stability values of correlation are:'];
   else
      res=[res;'The stability values of RMSEare:']; 
   end
   res=[res;num2str(pcpso)];
   if cr==1
      res=[res;strcat('p-value of correlation :',num2str(pv))];
   else
      res=[res;strcat('p-value of RMSE:',num2str(pv))]; 
   end
   if cr==1
      res=[res;strcat('Confidence interval of correlation :',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))]; 
   end
   if cr==1
      res=[res;strcat('The value of the test static for correlation:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for correlation:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated population standard deviation for correlation:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated population standard deviation for error:',num2str(stats.sd))];
   end
   res=[res;dline];
   [a,b]=size(hamcpso);
   CR=[CR;hamcpso(a,b)];
   CR_STD=[CR_STD;(stats.sd)];
   CR_L_CI=[CR_L_CI;(ci(1,1))];
   CR_H_CI=[CR_H_CI;(ci(1,2))];
   CR_P=[CR_P;pv];
   CR_TS=[CR_TS;stats.tstat];
   [a,b]=size(hampso);
   subplot(2,3,1),plot(a:b,hampso,'-s','linewidth',1);
   hold on;
   subplot(2,3,2),plot(a:b,hamapso,'-s','linewidth',1);
   hold on;
   subplot(2,3,3),plot(1:p,ppso,'-s','linewidth',1);
   hold on;
   subplot(2,3,4),plot(a:b,hamcpso,'-s','linewidth',1);
   hold on;
   subplot(2,3,5),plot(a:b,hamcapso,'-s','linewidth',1);
   hold on;
   subplot(2,3,6),plot(1:p,pcpso,'-s','linewidth',1);
   hold on;
end

x=get(handles.checkbox16,'value');
if x==1
    alname=[alname;'ACO'];
    alname=cellstr(alname);
   st=[st,'ACO'];
   res=[res;'Algorithm name : ACO'];
   res=[res;strcat('Number of selected features : ',acoc)];
   res=[res;'The selected feature indices are :'];
   res=[res;(acof)];
   res=[res;strcat('Elapsed time per one time run based on seconds:',acot)];
   if cr==1
      res=[res;'The convergence values of RMSEare:'];
   else
      res=[res;'The convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamaco)];
   if cr==1
      res=[res;'The average convergence values of RMSEare:'];
   else
      res=[res;'The average convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamaaco)];
   [h,pv,ci,stats]=ttest(paco);
   if cr==1
      res=[res;'The stability values of RMSEare:'];
   else
      res=[res;'The stability values of ',y_label,' are:']; 
   end
   res=[res;num2str(paco)];
   if cr==1
      res=[res;strcat('p-value of RMSE:',num2str(pv))];
   else
       res=[res;strcat('p-value of ',y_label,' :',num2str(pv))];
   end
   if cr==1
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of ',y_label,' :',num2str(ci))];
   end
   if cr==1
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for ',y_label,':',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for ',y_label,':',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated population standard deviation for error:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated population standard deviation for ',y_label,':',num2str(stats.sd))]; 
   end
   NOF=[NOF;acoc];
   ET=[ET;acot];
   [a,b]=size(hamaco);
   ER=[ER;hamaco(a,b)];
   ER_STD=[ER_STD;(stats.sd)];
   ER_L_CI=[ER_L_CI;(ci(1,1))];
   ER_H_CI=[ER_H_CI;(ci(1,2))];
   ER_P=[ER_P;pv];
   ER_TS=[ER_TS;stats.tstat];
    if cr==1
      res=[res;'The convergence values of correlation are:'];
   else
      res=[res;'The convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamcaco)];
   if cr==1
      res=[res;'The average convergence values of correlation are:'];
   else
      res=[res;'The average convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamcaaco)];
   [h,pv,ci,stats]=ttest(pcaco);
   if cr==1
      res=[res;'The stability values of correlation are:'];
   else
      res=[res;'The stability values of RMSEare:']; 
   end
   res=[res;num2str(pcaco)];
   if cr==1
      res=[res;strcat('p-value of correlation :',num2str(pv))];
   else
      res=[res;strcat('p-value of RMSE:',num2str(pv))]; 
   end
   if cr==1
      res=[res;strcat('Confidence interval of correlation :',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))]; 
   end
   if cr==1
      res=[res;strcat('The value of the test static for correlation:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for correlation:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated population standard deviation for correlation:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated population standard deviation for error:',num2str(stats.sd))];
   end
   res=[res;dline];
   [a,b]=size(hamcaco);
   CR=[CR;hamcaco(a,b)];
   CR_STD=[CR_STD;(stats.sd)];
   CR_L_CI=[CR_L_CI;(ci(1,1))];
   CR_H_CI=[CR_H_CI;(ci(1,2))];
   CR_P=[CR_P;pv];
   CR_TS=[CR_TS;stats.tstat];
   [a,b]=size(hamaco);
   subplot(2,3,1),plot(a:b,hamaco,'->','linewidth',1);
   hold on;
   subplot(2,3,2),plot(a:b,hamaaco,'->','linewidth',1);
   hold on;
   subplot(2,3,3),plot(1:p,paco,'->','linewidth',1);
   hold on;
   subplot(2,3,4),plot(a:b,hamcaco,'->','linewidth',1);
   hold on;
   subplot(2,3,5),plot(a:b,hamcaaco,'->','linewidth',1);
   hold on;
   subplot(2,3,6),plot(1:p,pcaco,'->','linewidth',1);
   hold on;
end

x=get(handles.checkbox17,'value');
if x==1
    alname=[alname;'ICA'];
    alname=cellstr(alname);
   st=[st,'ICA'];
   res=[res;'Algorithm name : ICA'];
   res=[res;strcat('Number of selected features : ',icac)];
   res=[res;'The selected feature indices are :'];
   res=[res;(icaf)];
   res=[res;strcat('Elapsed time per one time run based on seconds:',icat)];
   if cr==1
      res=[res;'The convergence values of RMSEare:'];
   else
      res=[res;'The convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamica)];
   if cr==1
      res=[res;'The average convergence values of RMSEare:'];
   else
      res=[res;'The average convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamaica)];
   [h,pv,ci,stats]=ttest(pica);
   if cr==1
      res=[res;'The stability values of RMSEare:'];
   else
      res=[res;'The stability values of ',y_label,' are:']; 
   end
   res=[res;num2str(pica)];
   if cr==1
      res=[res;strcat('p-value of RMSE:',num2str(pv))];
   else
       res=[res;strcat('p-value of ',y_label,' :',num2str(pv))];
   end
   if cr==1
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of ',y_label,' :',num2str(ci))];
   end
   if cr==1
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for ',y_label,':',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for ',y_label,':',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated population standard deviation for error:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated population standard deviation for ',y_label,':',num2str(stats.sd))]; 
   end
   NOF=[NOF;icac];
   ET=[ET;icat];
   [a,b]=size(hamica);
   ER=[ER;hamica(a,b)];
   ER_STD=[ER_STD;(stats.sd)];
   ER_L_CI=[ER_L_CI;(ci(1,1))];
   ER_H_CI=[ER_H_CI;(ci(1,2))];
   ER_P=[ER_P;pv];
   ER_TS=[ER_TS;stats.tstat];
    if cr==1
      res=[res;'The convergence values of correlation are:'];
   else
      res=[res;'The convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamcica)];
   if cr==1
      res=[res;'The average convergence values of correlation are:'];
   else
      res=[res;'The average convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamcaica)];
   [h,pv,ci,stats]=ttest(pcica);
   if cr==1
      res=[res;'The stability values of correlation are:'];
   else
      res=[res;'The stability values of RMSEare:']; 
   end
   res=[res;num2str(pcica)];
   if cr==1
      res=[res;strcat('p-value of correlation :',num2str(pv))];
   else
      res=[res;strcat('p-value of RMSE:',num2str(pv))]; 
   end
   if cr==1
      res=[res;strcat('Confidence interval of correlation :',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))]; 
   end
   if cr==1
      res=[res;strcat('The value of the test static for correlation:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for correlation:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated population standard deviation for correlation:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated population standard deviation for error:',num2str(stats.sd))];
   end
   res=[res;dline];
   [a,b]=size(hamcica);
   CR=[CR;hamcica(a,b)];
   CR_STD=[CR_STD;(stats.sd)];
   CR_L_CI=[CR_L_CI;(ci(1,1))];
   CR_H_CI=[CR_H_CI;(ci(1,2))];
   CR_P=[CR_P;pv];
   CR_TS=[CR_TS;stats.tstat];
   [a,b]=size(hamica);
   subplot(2,3,1),plot(a:b,hamica,'-v','linewidth',1);
   hold on;
   subplot(2,3,2),plot(a:b,hamaica,'-v','linewidth',1);
   hold on;
   subplot(2,3,3),plot(1:p,pica,'-v','linewidth',1);
   hold on;
   subplot(2,3,4),plot(a:b,hamcica,'-v','linewidth',1);
   hold on;
   subplot(2,3,5),plot(a:b,hamcaica,'-v','linewidth',1);
   hold on;
   subplot(2,3,6),plot(1:p,pcica,'-v','linewidth',1);
   hold on;
end

x=get(handles.checkbox18,'value');
if x==1
    alname=[alname;'LA'];
    alname=cellstr(alname);
   st=[st,'LA'];
   res=[res;'Algorithm name : LA'];
   res=[res;strcat('Number of selected features : ',lac)];
   res=[res;'The selected feature indices are :'];
   res=[res;(laf)];
   res=[res;strcat('Elapsed time per one time run based on seconds:',lat)];
   if cr==1
      res=[res;'The convergence values of RMSEare:'];
   else
      res=[res;'The convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamla)];
   if cr==1
      res=[res;'The average convergence values of RMSEare:'];
   else
      res=[res;'The average convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamala)];
   [h,pv,ci,stats]=ttest(pla);
   if cr==1
      res=[res;'The stability values of RMSEare:'];
   else
      res=[res;'The stability values of ',y_label,' are:']; 
   end
   res=[res;num2str(pla)];
   if cr==1
      res=[res;strcat('p-value of RMSE:',num2str(pv))];
   else
       res=[res;strcat('p-value of ',y_label,' :',num2str(pv))];
   end
   if cr==1
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of ',y_label,' :',num2str(ci))];
   end
   if cr==1
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for ',y_label,':',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for ',y_label,':',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated population standard deviation for error:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated population standard deviation for ',y_label,':',num2str(stats.sd))]; 
   end
   NOF=[NOF;lac];
   ET=[ET;lat];
   [a,b]=size(hamla);
   ER=[ER;hamla(a,b)];
   ER_STD=[ER_STD;(stats.sd)];
   ER_L_CI=[ER_L_CI;(ci(1,1))];
   ER_H_CI=[ER_H_CI;(ci(1,2))];
   ER_P=[ER_P;pv];
   ER_TS=[ER_TS;stats.tstat];
    if cr==1
      res=[res;'The convergence values of correlation are:'];
   else
      res=[res;'The convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamcla)];
   if cr==1
      res=[res;'The average convergence values of correlation are:'];
   else
      res=[res;'The average convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamcala)];
   [h,pv,ci,stats]=ttest(pcla);
   if cr==1
      res=[res;'The stability values of correlation are:'];
   else
      res=[res;'The stability values of RMSEare:']; 
   end
   res=[res;num2str(pcla)];
   if cr==1
      res=[res;strcat('p-value of correlation :',num2str(pv))];
   else
      res=[res;strcat('p-value of RMSE:',num2str(pv))]; 
   end
   if cr==1
      res=[res;strcat('Confidence interval of correlation :',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))]; 
   end
   if cr==1
      res=[res;strcat('The value of the test static for correlation:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for correlation:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated population standard deviation for correlation:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated population standard deviation for error:',num2str(stats.sd))];
   end
   res=[res;dline];
   [a,b]=size(hamcla);
   CR=[CR;hamcla(a,b)];
   CR_STD=[CR_STD;(stats.sd)];
   CR_L_CI=[CR_L_CI;(ci(1,1))];
   CR_H_CI=[CR_H_CI;(ci(1,2))];
   CR_P=[CR_P;pv];
   CR_TS=[CR_TS;stats.tstat];
   [a,b]=size(hamla);
   subplot(2,3,1),plot(a:b,hamla,'-^','linewidth',1);
   hold on;
   subplot(2,3,2),plot(a:b,hamala,'-^','linewidth',1);
   hold on;
   subplot(2,3,3),plot(1:p,pla,'-^','linewidth',1);
   hold on;
   subplot(2,3,4),plot(a:b,hamcla,'-^','linewidth',1);
   hold on;
   subplot(2,3,5),plot(a:b,hamcala,'-^','linewidth',1);
   hold on;
   subplot(2,3,6),plot(1:p,pcla,'-^','linewidth',1);
   hold on;
end

x=get(handles.checkbox19,'value');
if x==1
    alname=[alname;'HTS'];
    alname=cellstr(alname);
   st=[st,'HTS'];
   res=[res;'Algorithm name : HTS'];
   res=[res;strcat('Number of selected features : ',htsc)];
   res=[res;'The selected feature indices are :'];
   res=[res;(htsf)];
   res=[res;strcat('Ehtspsed time per one time run based on seconds:',htst)];
   if cr==1
      res=[res;'The convergence values of RMSEare:'];
   else
      res=[res;'The convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamhts)];
   if cr==1
      res=[res;'The average convergence values of RMSEare:'];
   else
      res=[res;'The average convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamahts)];
   [h,pv,ci,stats]=ttest(phts);
   if cr==1
      res=[res;'The stability values of RMSEare:'];
   else
      res=[res;'The stability values of ',y_label,' are:']; 
   end
   res=[res;num2str(phts)];
   if cr==1
      res=[res;strcat('p-value of RMSE:',num2str(pv))];
   else
       res=[res;strcat('p-value of ',y_label,' :',num2str(pv))];
   end
   if cr==1
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of ',y_label,' :',num2str(ci))];
   end
   if cr==1
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for ',y_label,':',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for ',y_label,':',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated popuhtstion standard deviation for error:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated popuhtstion standard deviation for ',y_label,':',num2str(stats.sd))]; 
   end
   NOF=[NOF;htsc];
   ET=[ET;htst];
   [a,b]=size(hamhts);
   ER=[ER;hamhts(a,b)];
   ER_STD=[ER_STD;(stats.sd)];
   ER_L_CI=[ER_L_CI;(ci(1,1))];
   ER_H_CI=[ER_H_CI;(ci(1,2))];
   ER_P=[ER_P;pv];
   ER_TS=[ER_TS;stats.tstat];
    if cr==1
      res=[res;'The convergence values of correhtstion are:'];
   else
      res=[res;'The convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamchts)];
   if cr==1
      res=[res;'The average convergence values of correhtstion are:'];
   else
      res=[res;'The average convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamcahts)];
   [h,pv,ci,stats]=ttest(pchts);
   if cr==1
      res=[res;'The stability values of correhtstion are:'];
   else
      res=[res;'The stability values of RMSEare:']; 
   end
   res=[res;num2str(pchts)];
   if cr==1
      res=[res;strcat('p-value of correhtstion :',num2str(pv))];
   else
      res=[res;strcat('p-value of RMSE:',num2str(pv))]; 
   end
   if cr==1
      res=[res;strcat('Confidence interval of correhtstion :',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))]; 
   end
   if cr==1
      res=[res;strcat('The value of the test static for correhtstion:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for correhtstion:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated popuhtstion standard deviation for correhtstion:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated popuhtstion standard deviation for error:',num2str(stats.sd))];
   end
   res=[res;dline];
   [a,b]=size(hamchts);
   CR=[CR;hamchts(a,b)];
   CR_STD=[CR_STD;(stats.sd)];
   CR_L_CI=[CR_L_CI;(ci(1,1))];
   CR_H_CI=[CR_H_CI;(ci(1,2))];
   CR_P=[CR_P;pv];
   CR_TS=[CR_TS;stats.tstat];
   [a,b]=size(hamhts);
   subplot(2,3,1),plot(a:b,hamhts,'-<','linewidth',1);
   hold on;
   subplot(2,3,2),plot(a:b,hamahts,'-<','linewidth',1);
   hold on;
   subplot(2,3,3),plot(1:p,phts,'-<','linewidth',1);
   hold on;
   subplot(2,3,4),plot(a:b,hamchts,'-<','linewidth',1);
   hold on;
   subplot(2,3,5),plot(a:b,hamcahts,'-<','linewidth',1);
   hold on;
   subplot(2,3,6),plot(1:p,pchts,'-<','linewidth',1);
   hold on;
end

x=get(handles.checkbox20,'value');
if x==1
    alname=[alname;'FOA'];
    alname=cellstr(alname);
   st=[st,'FOA'];
   res=[res;'Algorithm name : FOA'];
   res=[res;strcat('Number of selected features : ',foac)];
   res=[res;'The selected feature indices are :'];
   res=[res;(foaf)];
   res=[res;strcat('Efoapsed time per one time run based on seconds:',foat)];
   if cr==1
      res=[res;'The convergence values of RMSEare:'];
   else
      res=[res;'The convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamfoa)];
   if cr==1
      res=[res;'The average convergence values of RMSEare:'];
   else
      res=[res;'The average convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamafoa)];
   [h,pv,ci,stats]=ttest(pfoa);
   if cr==1
      res=[res;'The stability values of RMSEare:'];
   else
      res=[res;'The stability values of ',y_label,' are:']; 
   end
   res=[res;num2str(pfoa)];
   if cr==1
      res=[res;strcat('p-value of RMSE:',num2str(pv))];
   else
       res=[res;strcat('p-value of ',y_label,' :',num2str(pv))];
   end
   if cr==1
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of ',y_label,' :',num2str(ci))];
   end
   if cr==1
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for ',y_label,':',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for ',y_label,':',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated popufoation standard deviation for error:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated popufoation standard deviation for ',y_label,':',num2str(stats.sd))]; 
   end
   NOF=[NOF;foac];
   ET=[ET;foat];
   [a,b]=size(hamfoa);
   ER=[ER;hamfoa(a,b)];
   ER_STD=[ER_STD;(stats.sd)];
   ER_L_CI=[ER_L_CI;(ci(1,1))];
   ER_H_CI=[ER_H_CI;(ci(1,2))];
   ER_P=[ER_P;pv];
   ER_TS=[ER_TS;stats.tstat];
    if cr==1
      res=[res;'The convergence values of correfoation are:'];
   else
      res=[res;'The convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamcfoa)];
   if cr==1
      res=[res;'The average convergence values of correfoation are:'];
   else
      res=[res;'The average convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamcafoa)];
   [h,pv,ci,stats]=ttest(pcfoa);
   if cr==1
      res=[res;'The stability values of correfoation are:'];
   else
      res=[res;'The stability values of RMSEare:']; 
   end
   res=[res;num2str(pcfoa)];
   if cr==1
      res=[res;strcat('p-value of correfoation :',num2str(pv))];
   else
      res=[res;strcat('p-value of RMSE:',num2str(pv))]; 
   end
   if cr==1
      res=[res;strcat('Confidence interval of correfoation :',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))]; 
   end
   if cr==1
      res=[res;strcat('The value of the test static for correfoation:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for correfoation:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated popufoation standard deviation for correfoation:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated popufoation standard deviation for error:',num2str(stats.sd))];
   end
   res=[res;dline];
   [a,b]=size(hamcfoa);
   CR=[CR;hamcfoa(a,b)];
   CR_STD=[CR_STD;(stats.sd)];
   CR_L_CI=[CR_L_CI;(ci(1,1))];
   CR_H_CI=[CR_H_CI;(ci(1,2))];
   CR_P=[CR_P;pv];
   CR_TS=[CR_TS;stats.tstat];
   [a,b]=size(hamfoa);
   subplot(2,3,1),plot(a:b,hamfoa,'-+','linewidth',1);
   hold on;
   subplot(2,3,2),plot(a:b,hamafoa,'-+','linewidth',1);
   hold on;
   subplot(2,3,3),plot(1:p,pfoa,'-+','linewidth',1);
   hold on;
   subplot(2,3,4),plot(a:b,hamcfoa,'-+','linewidth',1);
   hold on;
   subplot(2,3,5),plot(a:b,hamcafoa,'-+','linewidth',1);
   hold on;
   subplot(2,3,6),plot(1:p,pcfoa,'-+','linewidth',1);
   hold on;
end

x=get(handles.checkbox21,'value');
if x==1
    alname=[alname;'DSOS'];
    alname=cellstr(alname);
   st=[st,'DSOS'];
   res=[res;'Algorithm name : DSOS'];
   res=[res;strcat('Number of selected features : ',dsosc)];
   res=[res;'The selected feature indices are :'];
   res=[res;(dsosf)];
   res=[res;strcat('Edsospsed time per one time run based on seconds:',dsost)];
   if cr==1
      res=[res;'The convergence values of RMSEare:'];
   else
      res=[res;'The convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamdsos)];
   if cr==1
      res=[res;'The average convergence values of RMSEare:'];
   else
      res=[res;'The average convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamadsos)];
   [h,pv,ci,stats]=ttest(pdsos);
   if cr==1
      res=[res;'The stability values of RMSEare:'];
   else
      res=[res;'The stability values of ',y_label,' are:']; 
   end
   res=[res;num2str(pdsos)];
   if cr==1
      res=[res;strcat('p-value of RMSE:',num2str(pv))];
   else
       res=[res;strcat('p-value of ',y_label,' :',num2str(pv))];
   end
   if cr==1
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of ',y_label,' :',num2str(ci))];
   end
   if cr==1
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for ',y_label,':',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for ',y_label,':',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated popudsostion standard deviation for error:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated popudsostion standard deviation for ',y_label,':',num2str(stats.sd))]; 
   end
   NOF=[NOF;dsosc];
   ET=[ET;dsost];
   [a,b]=size(hamdsos);
   ER=[ER;hamdsos(a,b)];
   ER_STD=[ER_STD;(stats.sd)];
   ER_L_CI=[ER_L_CI;(ci(1,1))];
   ER_H_CI=[ER_H_CI;(ci(1,2))];
   ER_P=[ER_P;pv];
   ER_TS=[ER_TS;stats.tstat];
    if cr==1
      res=[res;'The convergence values of corredsostion are:'];
   else
      res=[res;'The convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamcdsos)];
   if cr==1
      res=[res;'The average convergence values of corredsostion are:'];
   else
      res=[res;'The average convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamcadsos)];
   [h,pv,ci,stats]=ttest(pcdsos);
   if cr==1
      res=[res;'The stability values of corredsostion are:'];
   else
      res=[res;'The stability values of RMSEare:']; 
   end
   res=[res;num2str(pcdsos)];
   if cr==1
      res=[res;strcat('p-value of corredsostion :',num2str(pv))];
   else
      res=[res;strcat('p-value of RMSE:',num2str(pv))]; 
   end
   if cr==1
      res=[res;strcat('Confidence interval of corredsostion :',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))]; 
   end
   if cr==1
      res=[res;strcat('The value of the test static for corredsostion:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for corredsostion:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated popudsostion standard deviation for corredsostion:',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated popudsostion standard deviation for error: ',num2str(stats.sd))];
   end
   res=[res;dline];
   [a,b]=size(hamcdsos);
   CR=[CR;hamcdsos(a,b)];
   CR_STD=[CR_STD;(stats.sd)];
   CR_L_CI=[CR_L_CI;(ci(1,1))];
   CR_H_CI=[CR_H_CI;(ci(1,2))];
   CR_P=[CR_P;pv];
   CR_TS=[CR_TS;stats.tstat];
   [a,b]=size(hamdsos);
   subplot(2,3,1),plot(a:b,hamdsos,'-*','linewidth',1);
   hold on;
   subplot(2,3,2),plot(a:b,hamadsos,'-*','linewidth',1);
   hold on;
   subplot(2,3,3),plot(1:p,pdsos,'-*','linewidth',1);
   hold on;
   subplot(2,3,4),plot(a:b,hamcdsos,'-*','linewidth',1);
   hold on;
   subplot(2,3,5),plot(a:b,hamcadsos,'-*','linewidth',1);
   hold on;
   subplot(2,3,6),plot(1:p,pcdsos,'-*','linewidth',1);
   hold on;
end

x=get(handles.checkbox22,'value');
if x==1
    alname=[alname;'CUK'];
    alname=cellstr(alname);
   st=[st,'CUK'];
   res=[res;'Algorithm name : CUK'];
   res=[res;strcat('Number of selected features: ',cukc)];
   res=[res;'The selected feature indices are :'];
   res=[res;(cukf)];
   res=[res;strcat('Ecukpsed time per one time run based on seconds: ',cukt)];
   if cr==1
      res=[res;'The convergence values of RMSEare:'];
   else
      res=[res;'The convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamcuk)];
   if cr==1
      res=[res;'The average convergence values of RMSEare:'];
   else
      res=[res;'The average convergence values of ',y_label,' are:']; 
   end
   res=[res;num2str(hamacuk)];
   [h,pv,ci,stats]=ttest(pcuk);
   if cr==1
      res=[res;'The stability values of RMSEare:'];
   else
      res=[res;'The stability values of ',y_label,' are:']; 
   end
   res=[res;num2str(pcuk)];
   if cr==1
      res=[res;strcat('p-value of RMSE:',num2str(pv))];
   else
       res=[res;strcat('p-value of ',y_label,': ',num2str(pv))];
   end
   if cr==1
      res=[res;strcat('Confidence interval of RMSE:',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of ',y_label,': ',num2str(ci))];
   end
   if cr==1
      res=[res;strcat('The value of the test static for error:',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for ',y_label,': ',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for error:',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for ',y_label,': ',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated popucuktion standard deviation for error: ',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated popucuktion standard deviation for ',y_label,': ',num2str(stats.sd))]; 
   end
   NOF=[NOF;cukc];
   ET=[ET;cukt];
   [a,b]=size(hamcuk);
   ER=[ER;hamcuk(a,b)];
   ER_STD=[ER_STD;(stats.sd)];
   ER_L_CI=[ER_L_CI;(ci(1,1))];
   ER_H_CI=[ER_H_CI;(ci(1,2))];
   ER_P=[ER_P;pv];
   ER_TS=[ER_TS;stats.tstat];
    if cr==1
      res=[res;'The convergence values of correcuktion are:'];
   else
      res=[res;'The convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamccuk)];
   if cr==1
      res=[res;'The average convergence values of correcuktion are:'];
   else
      res=[res;'The average convergence values of RMSEare:']; 
   end
   res=[res;num2str(hamcacuk)];
   [h,pv,ci,stats]=ttest(pccuk);
   if cr==1
      res=[res;'The stability values of correcuktion are: '];
   else
      res=[res;'The stability values of RMSEare: ']; 
   end
   res=[res;num2str(pccuk)];
   if cr==1
      res=[res;strcat('p-value of correlation: ',num2str(pv))];
   else
      res=[res;strcat('p-value of RMSE:',num2str(pv))]; 
   end
   if cr==1
      res=[res;strcat('Confidence interval of correcuktion: ',num2str(ci))];
   else
      res=[res;strcat('Confidence interval of RMSE: ',num2str(ci))]; 
   end
   if cr==1
      res=[res;strcat('The value of the test static for correcuktion: ',num2str(stats.tstat))];
   else
      res=[res;strcat('The value of the test static for error: ',num2str(stats.tstat))];
   end
   if cr==1
      res=[res;strcat('The degree of freedom of the test for correcuktion: ',num2str(stats.df))];
   else
      res=[res;strcat('The degree of freedom of the test for error: ',num2str(stats.df))];
   end
   if cr==1
      res=[res;strcat('The estimated popucuktion standard deviation for correcuktion: ',num2str(stats.sd))];
   else
      res=[res;strcat('The estimated popucuktion standard deviation for error: ',num2str(stats.sd))];
   end
   res=[res;dline];
   [a,b]=size(hamccuk);
   CR=[CR;hamccuk(a,b)];
   CR_STD=[CR_STD;(stats.sd)];
   CR_L_CI=[CR_L_CI;(ci(1,1))];
   CR_H_CI=[CR_H_CI;(ci(1,2))];
   CR_P=[CR_P;pv];
   CR_TS=[CR_TS;stats.tstat];
   [a,b]=size(hamcuk);
   subplot(2,3,1),plot(a:b,hamcuk,'-.','linewidth',1);
   hold on;
   subplot(2,3,2),plot(a:b,hamacuk,'-.','linewidth',1);
   hold on;
   subplot(2,3,3),plot(1:p,pcuk,'-.','linewidth',1);
   hold on;
   subplot(2,3,4),plot(a:b,hamccuk,'-.','linewidth',1);
   hold on;
   subplot(2,3,5),plot(a:b,hamcacuk,'-.','linewidth',1);
   hold on;
   subplot(2,3,6),plot(1:p,pccuk,'-.','linewidth',1);
   hold on;
end
[a,b]=size(st);
st=st(a,2:b);
subplot(2,3,1),legend(st);
xlabel('Iteration');
if cr==1
    title('Convergence of error');
    ylabel('Error');
else
    ylabel(y_label);
    title(['Convergence of ',' ',y_label]);
end
subplot(2,3,2),legend(st);
xlabel('Iteration');
if cr==1
ylabel('Average RMSE of all samples');
title('Average convegence of error');
else
ylabel(['Average',' ',y_label,' of all samples']);
title(['Average convegence of',' ',y_label]);
end
subplot(2,3,3),legend(st);
xlabel('Execution number');
if cr==1
ylabel('Error');
title('Stability diagram of error');
else
ylabel(y_label);
title(['Convergence of',' ',y_label]);
end
subplot(2,3,4),legend(st);
xlabel('Iteration');
if cr==1
ylabel('Correlation');
title('Convergence of Correlation');
else
ylabel('Error');
title('Convergence of Error');   
end
subplot(2,3,5),legend(st);
xlabel('Iteration');
if cr==1
ylabel('Average correlation of all samples');
title('Average convegence of correlation');
else
ylabel('Average RMSEof all samples');
title('Average convegence of error');    
end
subplot(2,3,6),legend(st);
xlabel('Execution number');
if cr==1
ylabel('Correlation');
title('Stability diagram of correlation');
else
ylabel('Error');
title('Stability diagram of error');   
end

ER_CI=[ER_L_CI,ER_H_CI];
CR_CI=[CR_L_CI,CR_H_CI];
AC=ER;
AC_STD=ER_STD;
AC_CI=ER_CI;
AC_P=ER_P;
AC_TS=ER_TS;
alname=cellstr(alname);
AL_NAME=alname;

t=clock;
%saveas(f1,strcat('results/Diagram_',num2str(t(1,1)),'_',num2str(t(1,2)),'_',num2str(t(1,3)),'_',num2str(t(1,4)),'_',num2str(t(1,5)),'_',num2str(t(1,6))),'fig');
fid=fopen(strcat('results\Description_',num2str(t(1,1)),'_',num2str(t(1,2)),'_',num2str(t(1,3)),'_',num2str(t(1,4)),'_',num2str(t(1,5)),'_',num2str(t(1,6)),'.txt'),'at');
for i=1:size(res,1)
    fprintf(fid,'%s\n',res{i,:});
end
fclose(fid);

if cr==1
   T = table(AL_NAME,NOF,ET,ER,ER_STD,ER_CI,ER_P,ER_TS,CR,CR_STD,CR_CI,CR_P,CR_TS)
else
   ER=CR;
   ER_STD=CR_STD;
   ER_CI=CR_CI;
   ER_P=CR_P;
   ER_TS=CR_TS;
   SC=AC;
   SC_STD=AC_STD;
   SC_CI=AC_CI;
   SC_P=AC_P;
   SC_TS=AC_TS;
   T = table(AL_NAME,NOF,ET,SC,SC_STD,SC_CI,SC_P,SC_TS,ER,ER_STD,ER_CI,ER_P,ER_TS);
end
writetable(T,strcat('results\tbls_',num2str(t(1,1)),'_',num2str(t(1,2)),'_',num2str(t(1,3)),'_',num2str(t(1,4)),'_',num2str(t(1,5)),'_',num2str(t(1,6)),'.xls'));
sv=get(handles.edit9,'string');
if contains(sv,'-v')
    cr=1;
end
if cr==0
   loadedfile=get(handles.edit1,'string');
   input=importdata(loadedfile);
   labelc=str2num(get(handles.edit2,'string'));
   label=input(:,labelc);
   input(:,labelc)=[];
   val=get(handles.checkbox23,'value');
   if val==1
      input(1,:)=[];
   end
   val=get(handles.checkbox24,'value');
   if val==1
      input(:,1)=[];
   end
   dp=get(handles.edit10,'string');
   dp=str2num(dp);
   SEN=[];
   SPC=[];
   PRE=[];
   FPR=[];
   ACC=[];
   x=get(handles.checkbox12,'value'); 
   ct=get(handles.popupmenu2,'value');
   iteration=get(handles.edit79,'string');
   iteration=str2num(iteration);
   
   ff2=figure;
   subplot(1,2,2),plot(0:.1:1,0:.1:1,'--r');
   hold on;
   text(.4,.4,'\rightarrow','FontSize',20,'Rotation',135);
   text(.4,.4,'\rightarrow','FontSize',20,'Rotation',-45);
   text(.3,.5,'Beter');
   text(.4,.3,'Worse');
   title('ROC space');
   xlabel('FPR');
   ylabel('TPR');
   alname=cellstr(alname);
   alname=[cellstr('Random guess');alname];
   subplot(1,2,1),plot(0:.1:1,0:.1:1,'--r');
   title('ROC');
   xlabel('FPR');
   ylabel('TPR');
   hold on;
   if x==1
      [sen,spc,pre,fpk,acc]=tptn(fwcc,input,dp,label,sv,ct,iteration); 
      SEN=[SEN;sen];
      SPC=[SPC;spc];
      PRE=[PRE;pre];
      FPR=[FPR;fpk];
      ACC=[ACC;acc];
      h=[0 1-spc 1];
      v=[0 sen 1];
      subplot(1,2,2),plot(h(1,2),v(1,2),'d','linewidth',1);
      hold on;
      subplot(1,2,1),plot(h,v,'-d','linewidth',1);
      hold on;
   end
    x=get(handles.checkbox13,'value'); 
   if x==1
      [sen,spc,pre,fpk,acc]=tptn(flca,input,dp,label,sv,ct,iteration); 
      SEN=[SEN;sen];
      SPC=[SPC;spc];
      PRE=[PRE;pre];
      FPR=[FPR;fpk];
      ACC=[ACC;acc];
      h=[0 1-spc 1];
      v=[0 sen 1];
      subplot(1,2,2),plot(h(1,2),v(1,2),'o','linewidth',1);
      hold on;
      subplot(1,2,1),plot(h,v,'-o','linewidth',1);
      hold on;
   end
    x=get(handles.checkbox14,'value'); 
   if x==1
      [sen,spc,pre,fpk,acc]=tptn(fga,input,dp,label,sv,ct,iteration); 
      SEN=[SEN;sen];
      SPC=[SPC;spc];
      PRE=[PRE;pre];
      FPR=[FPR;fpk];
      ACC=[ACC;acc];
      h=[0 1-spc 1];
      v=[0 sen 1];
      subplot(1,2,2),plot(h(1,2),v(1,2),'x','linewidth',1);
      hold on;
      subplot(1,2,1),plot(h,v,'-x','linewidth',1);
      hold on;
   end
    x=get(handles.checkbox15,'value'); 
   if x==1
      [sen,spc,pre,fpk,acc]=tptn(fpso,input,dp,label,sv,ct,iteration); 
      SEN=[SEN;sen];
      SPC=[SPC;spc];
      PRE=[PRE;pre];
      FPR=[FPR;fpk];
      ACC=[ACC;acc];
      h=[0 1-spc 1];
      v=[0 sen 1];
      subplot(1,2,2),plot(h(1,2),v(1,2),'s','linewidth',1);
      hold on;
      subplot(1,2,1),plot(h,v,'-s','linewidth',1);
      hold on;
   end
    x=get(handles.checkbox16,'value'); 
   if x==1
      [sen,spc,pre,fpk,acc]=tptn(faco,input,dp,label,sv,ct,iteration); 
      SEN=[SEN;sen];
      SPC=[SPC;spc];
      PRE=[PRE;pre];
      FPR=[FPR;fpk];
      ACC=[ACC;acc];
      h=[0 1-spc 1];
      v=[0 sen 1];
      subplot(1,2,2),plot(h(1,2),v(1,2),'>','linewidth',1);
      hold on;
      subplot(1,2,1),plot(h,v,'->','linewidth',1);
      hold on;
   end
    x=get(handles.checkbox17,'value'); 
   if x==1
      [sen,spc,pre,fpk,acc]=tptn(fica,input,dp,label,sv,ct,iteration); 
      SEN=[SEN;sen];
      SPC=[SPC;spc];
      PRE=[PRE;pre];
      FPR=[FPR;fpk];
      ACC=[ACC;acc];
      h=[0 1-spc 1];
      v=[0 sen 1];
      subplot(1,2,2),plot(h(1,2),v(1,2),'v','linewidth',1);
      hold on;
      subplot(1,2,1),plot(h,v,'-v','linewidth',1);
      hold on;
   end
    x=get(handles.checkbox18,'value'); 
   if x==1
      [sen,spc,pre,fpk,acc]=tptn(fla,input,dp,label,sv,ct,iteration); 
      SEN=[SEN;sen];
      SPC=[SPC;spc];
      PRE=[PRE;pre];
      FPR=[FPR;fpk];
      ACC=[ACC;acc];
      h=[0 1-spc 1];
      v=[0 sen 1];
      subplot(1,2,2),plot(h(1,2),v(1,2),'^','linewidth',1);
      hold on;
      subplot(1,2,1),plot(h,v,'-^','linewidth',1);
      hold on;
   end
    x=get(handles.checkbox19,'value'); 
   if x==1
      [sen,spc,pre,fpk,acc]=tptn(fhts,input,dp,label,sv,ct,iteration); 
      SEN=[SEN;sen];
      SPC=[SPC;spc];
      PRE=[PRE;pre];
      FPR=[FPR;fpk];
      ACC=[ACC;acc];
      h=[0 1-spc 1];
      v=[0 sen 1];
      subplot(1,2,2),plot(h(1,2),v(1,2),'<','linewidth',1);
      hold on;
      subplot(1,2,1),plot(h,v,'-<','linewidth',1);
      hold on;
   end
    x=get(handles.checkbox20,'value'); 
   if x==1
      [sen,spc,pre,fpk,acc]=tptn(ffoa,input,dp,label,sv,ct,iteration); 
      SEN=[SEN;sen];
      SPC=[SPC;spc];
      PRE=[PRE;pre];
      FPR=[FPR;fpk];
      ACC=[ACC;acc];
      h=[0 1-spc 1];
      v=[0 sen 1];
      subplot(1,2,2),plot(h(1,2),v(1,2),'+','linewidth',1);
      hold on;
      subplot(1,2,1),plot(h,v,'-+','linewidth',1);
      hold on;
   end
    x=get(handles.checkbox21,'value'); 
   if x==1
      [sen,spc,pre,fpk,acc]=tptn(fdsos,input,dp,label,sv,ct,iteration); 
      SEN=[SEN;sen];
      SPC=[SPC;spc];
      PRE=[PRE;pre];
      FPR=[FPR;fpk];
      ACC=[ACC;acc];
      h=[0 1-spc 1];
      v=[0 sen 1];
      subplot(1,2,2),plot(h(1,2),v(1,2),'*','linewidth',1);
      hold on;
      subplot(1,2,1),plot(h,v,'-*','linewidth',1);
      hold on;
   end
    x=get(handles.checkbox22,'value'); 
   if x==1
      [sen,spc,pre,fpk,acc]=tptn(fcuk,input,dp,label,sv,ct,iteration); 
      SEN=[SEN;sen];
      SPC=[SPC;spc];
      PRE=[PRE;pre];
      FPR=[FPR;fpk];
      ACC=[ACC;acc];
      h=[0 1-spc 1];
      v=[0 sen 1];
      subplot(1,2,2),plot(h(1,2),v(1,2),'.','linewidth',1,'MarkerSize',10);
      hold on;
      subplot(1,2,1),plot(h,v,'-.','linewidth',1,'MarkerSize',10);
      hold on;
   end
   subplot(1,2,1),legend(alname);
   subplot(1,2,2),legend(alname);
   EVALUATION = table(AL_NAME,SEN,SPC,PRE,FPR,ACC);
   writetable(EVALUATION,strcat('results\evaluation_',num2str(t(1,1)),'_',num2str(t(1,2)),'_',num2str(t(1,3)),'_',num2str(t(1,4)),'_',num2str(t(1,5)),'_',num2str(t(1,6)),'.xls'));
end
%saveas(f1,strcat('results/ROC_',num2str(t(1,1)),'_',num2str(t(1,2)),'_',num2str(t(1,3)),'_',num2str(t(1,4)),'_',num2str(t(1,5)),'_',num2str(t(1,6))),'fig');
clc
res
T
if cr==0
    EVALUATION
end


function edit76_Callback(hObject, eventdata, handles)
% hObject    handle to edit76 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit76 as text
%        str2double(get(hObject,'String')) returns contents of edit76 as a double


% --- Executes during object creation, after setting all properties.
function edit76_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit76 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox23.
function checkbox23_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox23


% --- Executes on button press in checkbox24.
function checkbox24_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox24


% --- Executes on scroll wheel click while the figure is in focus.
function figure1_WindowScrollWheelFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	VerticalScrollCount: signed integer indicating direction and number of clicks
%	VerticalScrollAmount: number of lines scrolled for each click
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox25.
function checkbox25_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox25
cr=get(handles.checkbox25,'value');
set(handles.popupmenu3,'value',2);
set(handles.popupmenu3,'enable','on');
% set(handles.checkbox39,'enable','on');
% set(handles.checkbox40,'enable','on');
% set(handles.checkbox41,'enable','on');
set(handles.checkbox39,'value',0);
set(handles.checkbox40,'value',0);
set(handles.checkbox41,'value',0);
set(handles.checkbox37,'value',1);
if cr==1
    set(handles.popupmenu3,'value',1);
    set(handles.popupmenu3,'enable','off'); 
%     set(handles.checkbox39,'enable','off');
%     set(handles.checkbox40,'enable','off');
%     set(handles.checkbox41,'enable','off');
end


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pushbutton18_Callback(hObject, eventdata, handles)


% --- Executes on key press with focus on figure1 or any of its controls.
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
k=get(gcf,'CurrentKey');
if strcmp(k,'windows')
    open('help\Tutorial for FEATURESELECT.pdf');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
x=get(handles.popupmenu2,'value');
if x==1
    set(handles.uipanel5,'visible','on');
    set(handles.uipanel27,'visible','off');
    set(handles.uipanel28,'visible','off');
end
if (x==2)
    set(handles.uipanel27,'visible','on');
    set(handles.uipanel28,'visible','off');
    set(handles.uipanel5,'visible','off');
    set(handles.pushbutton28,'enable','on');
    set(handles.pushbutton29,'enable','off');
end
if (x==3)
    set(handles.uipanel28,'visible','on');
    set(handles.uipanel27,'visible','off');
    set(handles.uipanel5,'visible','off');
    set(handles.pushbutton28,'enable','off');
    set(handles.pushbutton29,'enable','on');
end
k=get(handles.popupmenu2,'value');
set(handles.popupmenu9,'value',k);


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=get(handles.popupmenu4,'value');
set(handles.uipanel29,'visible','off');
set(handles.uipanel23,'visible','off');
set(handles.uipanel30,'visible','off');
if x==1
    set(handles.uipanel23,'visible','on');
elseif x==2
    set(handles.uipanel29,'visible','on');
else
    set(handles.uipanel30,'visible','on');   
    set(handles.popupmenu7,'value',2);
    popupmenu7_Callback(hObject,eventdata,handles);
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over popupmenu4.
function popupmenu4_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
tic;
str1='Please wait ...';
str2='Neural network is running';
str1=cellstr(str1);
str2=cellstr(str2);
st=[str2;str1];
set(handles.listbox1,'string',st);
pause(1);
tp=get(handles.edit10,'string');
tp=str2num(tp);
tp=tp/100;
sv=get(handles.edit9,'string');
nopar= 1;
loadedfile=get(handles.edit1,'string');
input=importdata(loadedfile);
labelc=str2num(get(handles.edit2,'string'));
val=get(handles.checkbox23,'value');
if val==1
   input(1,:)=[];
end
val=get(handles.checkbox24,'value');
if val==1
   input(:,1)=[];
end
[m,n]=size(input);
n=n-1;
label=input(:,labelc);
input(:,labelc)=[];
iteration=get(handles.edit79,'string');
iteration=str2num(iteration);
cr=get(handles.checkbox25,'value');
[ sen,spc,prc,acc,err,crr ] = neural_network( input,label,iteration,tp,cr );
se=['The value of error is : ',num2str(err)];
se=cellstr(se);
sc=['The value of correlation is : ',num2str(crr)];
sc=cellstr(sc);
sa=['The value of accuracy is : ',num2str(acc)];
sa=cellstr(sa);
sp=['The value of precision is : ',num2str(prc)];
sp=cellstr(sp);
spc=['The value of specificity is : ',num2str(spc)];
spc=cellstr(spc);
ss=['The value of sensitivity is : ',num2str(sen)];
ss=cellstr(ss);
if cr==1
   st=[se;sc]; 
else
   st=[sa;spc;ss;sp;se;sc]; 
end
set(handles.listbox1, 'String',st);
st = cellstr(get(handles.listbox1,'string'));
st2=['The elapsed time of Nueral network based on seconds is : ',num2str(toc)];
st2=cellstr(st2);
set(handles.listbox1, 'String',[st;st2]);
clc


% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
tic;
str1='Please wait ...';
str2='Decision tree is running';
str1=cellstr(str1);
str2=cellstr(str2);
st=[str2;str1];
set(handles.listbox1,'string',st);
pause(1);
tp=get(handles.edit10,'string');
tp=str2num(tp);
tp=tp/100;
sv=get(handles.edit9,'string');
nopar= 1;
loadedfile=get(handles.edit1,'string');
input=importdata(loadedfile);
labelc=str2num(get(handles.edit2,'string'));
val=get(handles.checkbox23,'value');
if val==1
   input(1,:)=[];
end
val=get(handles.checkbox24,'value');
if val==1
   input(:,1)=[];
end
[m,n]=size(input);
n=n-1;
particles=1:n+3;
label=input(:,labelc);
input(:,labelc)=[];
particles=score(particles,input,label,tp,sv);
x=get(handles.checkbox25,'value');
if x==1
st='The value of RMSE is: ';
else
st='The value of score is: ';    
end
if x==1
st=strcat(st,num2str(particles(1,n+2)));
else
st=strcat(st,num2str(-particles(1,n+2)));
end
set(handles.listbox1, 'String',st);
st = cellstr(get(handles.listbox1,'string'));
st2='The elapsed time of Decision tree based on seconds is:  ';
st2=strcat(st2,num2str(toc));
st3='The value of correlation is: ';
st3=strcat(st3,num2str(particles(1,n+3)));
set(handles.listbox1, 'String',[st;st2;st3]);
clc


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit79_Callback(hObject, eventdata, handles)
% hObject    handle to edit79 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit79 as text
%        str2double(get(hObject,'String')) returns contents of edit79 as a double


% --- Executes during object creation, after setting all properties.
function edit79_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit79 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
tic;
tp=get(handles.edit10,'string');
tp=str2num(tp);
sv=get(handles.edit9,'string');
loadedfile=get(handles.edit1,'string');
input=importdata(loadedfile);
labelc=str2num(get(handles.edit2,'string'));
val=get(handles.checkbox23,'value');
global besten;
besten=[];
if val==1
   input(1,:)=[];
end
val=get(handles.checkbox24,'value');
if val==1
   input(:,1)=[];
end
label=input(:,labelc);
input(:,labelc)=[];
nof=get(handles.edit63,'string');
nof=str2num(nof);
SEN=[];
SPC=[];
PRE=[];
FPR=[];
ACC=[];
ERR=[];
CR=[];
ct=get(handles.popupmenu2,'value');
iteration=get(handles.edit79,'string');
iteration=str2num(iteration);
rc=get(handles.checkbox25,'value');
alname='';
if rc==0
    ff2=figure;
    subplot(1,2,2),plot(0:.1:1,0:.1:1,'--r');
    hold on;
    text(.4,.4,'\rightarrow','FontSize',20,'Rotation',135);
    text(.4,.4,'\rightarrow','FontSize',20,'Rotation',-45);
    text(.3,.5,'Beter');
    text(.4,.3,'Worse');
    title('ROC space');
    xlabel('FPR');
    ylabel('TPR');
    %alname=cellstr(alname);
    %alname=[cellstr('Random guess');alname];
    subplot(1,2,1),plot(0:.1:1,0:.1:1,'--r');
    title('ROC');
    xlabel('FPR');
    ylabel('TPR');
    hold on;
end
res=[];
res='This application has been developed in laboratory of systems biology and bioinformatics (LBB)';
res=cellstr(res);
dline='---------------------------------------------------------------------------------------------';
dline=cellstr(dline);
res=[dline;res];
res=[dline;res];
res=[res;dline];
res=[res;dline];
x=get(handles.checkbox37,'value');
if x==1
    str1='Please wait ...';
    str2='Pearson correlation is calculating';
    str1=cellstr(str1);
    str2=cellstr(str2);
    st=[str2;str1];
    set(handles.listbox1,'string',st);
    pause(1);
   sen=[];
   spc=[];
   pre=[];
   fpk=[];
   acc=[];
   err=[];
   crr=[];
   alname=[alname;'Pearson correlation']; 
   alname=cellstr(alname);
   features=pearson_correlation(input,nof);
   besten=features;
   res=[res;'Method name : Perason correlation'];
   res=[res;'The selected feature indices are :'];
   res=[res;num2str(features)];
   res=[res;dline];
   res=[res;dline];
   if rc==0
      [sen,spc,pre,fpk,acc]=tptn(features,input,tp,label,sv,ct,iteration);
   end
   if rc==1
      [err,crr]=filter_err(features,input,tp,label,sv,ct,iteration);
   end
   SEN=[SEN;sen];
   SPC=[SPC;spc];
   PRE=[PRE;pre];
   FPR=[FPR;fpk];
   ACC=[ACC;acc];
   ERR=[ERR;err];
   CR=[CR;crr];
   if rc==0
       h=[0 1-spc 1];
       v=[0 sen 1];
       subplot(1,2,2),plot(h(1,2),v(1,2),'d','linewidth',1);
       hold on;
       subplot(1,2,1),plot(h,v,'-d','linewidth',1);
       hold on;
   end
end
x=get(handles.checkbox38,'value');
if x==1
    str1='Please wait ...';
    str2='Laplacian scoring is calculating';
    str1=cellstr(str1);
    str2=cellstr(str2);
    st=[str2;str1];
    set(handles.listbox1,'string',st);
    pause(1);
   sen=[];
   spc=[];
   pre=[];
   fpk=[];
   acc=[];
   err=[];
   crr=[];
   alname=[alname;'Laplacian']; 
   alname=cellstr(alname);
   features=laplacian(input,nof);
   besten=features;
   res=[res;'Method name : Laplacian'];
   res=[res;'The selected feature indices are :'];
   res=[res;num2str(features)];
   res=[res;dline];
   res=[res;dline];
   if rc==0
      [sen,spc,pre,fpk,acc]=tptn(features,input,tp,label,sv,ct,iteration);
   end
   if rc==1
      [err,crr]=filter_err(features,input,tp,label,sv,ct,iteration);
   end
   SEN=[SEN;sen];
   SPC=[SPC;spc];
   PRE=[PRE;pre];
   FPR=[FPR;fpk];
   ACC=[ACC;acc];
   ERR=[ERR;err];
   CR=[CR;crr];
   if rc==0
       h=[0 1-spc 1];
       v=[0 sen 1];
       subplot(1,2,2),plot(h(1,2),v(1,2),'s','linewidth',1);
       hold on;
       subplot(1,2,1),plot(h,v,'-s','linewidth',1);
       hold on;
   end
end
x=get(handles.checkbox39,'value');
if x==1
    str1='Please wait ...';
    str2='Entropy scoring is calculating';
    str1=cellstr(str1);
    str2=cellstr(str2);
    st=[str2;str1];
    set(handles.listbox1,'string',st);
    pause(1);
   sen=[];
   spc=[];
   pre=[];
   fpk=[];
   acc=[];
   err=[];
   crr=[];
   alname=[alname;'Entropy']; 
   alname=cellstr(alname);
   features=entropy(input,nof);
   besten=features;
   res=[res;'Method name : Entropy'];
   res=[res;'The selected feature indices are :'];
   res=[res;num2str(features)];
   res=[res;dline];
   res=[res;dline];
   if rc==0
      [sen,spc,pre,fpk,acc]=tptn(features,input,tp,label,sv,ct,iteration);
   end
   if rc==1
      [err,crr]=filter_err(features,input,tp,label,sv,ct,iteration);
   end
   SEN=[SEN;sen];
   SPC=[SPC;spc];
   PRE=[PRE;pre];
   FPR=[FPR;fpk];
   ACC=[ACC;acc];
   ERR=[ERR;err];
   CR=[CR;crr];
   if rc==0
       h=[0 1-spc 1];
       v=[0 sen 1];
       subplot(1,2,2),plot(h(1,2),v(1,2),'x','linewidth',1);
       hold on;
       subplot(1,2,1),plot(h,v,'-x','linewidth',1);
       hold on;
   end
end
x=get(handles.checkbox40,'value');
if x==1
    str1='Please wait ...';
    str2='Mutual information scoring is calculating';
    str1=cellstr(str1);
    str2=cellstr(str2);
    st=[str2;str1];
    set(handles.listbox1,'string',st);
    pause(1);
   sen=[];
   spc=[];
   pre=[];
   fpk=[];
   acc=[];
   err=[];
   crr=[];
   alname=[alname;'Mutual information']; 
   alname=cellstr(alname);
   features=mutual(input,nof);
   besten=features;
   res=[res;'Method name : Mutual information'];
   res=[res;'The selected feature indices are :'];
   res=[res;num2str(features)];
   res=[res;dline];
   res=[res;dline];
   if rc==0
      [sen,spc,pre,fpk,acc]=tptn(features,input,tp,label,sv,ct,iteration);
   end
   if rc==1
      [err,crr]=filter_err(features,input,tp,label,sv,ct,iteration);
   end
   SEN=[SEN;sen];
   SPC=[SPC;spc];
   PRE=[PRE;pre];
   FPR=[FPR;fpk];
   ACC=[ACC;acc];
   ERR=[ERR;err];
   CR=[CR;crr];
   if rc==0
       h=[0 1-spc 1];
       v=[0 sen 1];
       subplot(1,2,2),plot(h(1,2),v(1,2),'<','linewidth',1);
       hold on;
       subplot(1,2,1),plot(h,v,'-<','linewidth',1);
       hold on;
   end
end
x=get(handles.checkbox41,'value');
if x==1
    str1='Please wait ...';
    str2='Fisher scoring is calculating';
    str1=cellstr(str1);
    str2=cellstr(str2);
    st=[str2;str1];
    set(handles.listbox1,'string',st);
    pause(1);
   sen=[];
   spc=[];
   pre=[];
   fpk=[];
   acc=[];
   err=[];
   crr=[];
   alname=[alname;'Fisher']; 
   alname=cellstr(alname);
   features=fisher(input,nof,label);
   besten=features;
   res=[res;'Method name : Fisher'];
   res=[res;'The selected feature indices are :'];
   res=[res;num2str(features)];
   res=[res;dline];
   res=[res;dline];
   if rc==0
      [sen,spc,pre,fpk,acc]=tptn(features,input,tp,label,sv,ct,iteration);
   end
   if rc==1
      [err,crr]=filter_err(features,input,tp,label,sv,ct,iteration);
   end
   SEN=[SEN;sen];
   SPC=[SPC;spc];
   PRE=[PRE;pre];
   FPR=[FPR;fpk];
   ACC=[ACC;acc];
   ERR=[ERR;err];
   CR=[CR;crr];
   if rc==0
       h=[0 1-spc 1];
       v=[0 sen 1];
       subplot(1,2,2),plot(h(1,2),v(1,2),'>','linewidth',1);
       hold on;
       subplot(1,2,1),plot(h,v,'->','linewidth',1);
       hold on;
   end
end
st1='The selcted methods were performed';
st1=cellstr(st1);
st2='The results are available in program directory';
st2=cellstr(st2);
ne = [st1;st2];
set(handles.listbox1,'String',ne);
METHOD=alname;
t=clock;
if rc==1
   T=table(METHOD,ERR,CR) 
   writetable(T,strcat('results\erro_and_correlation_',num2str(t(1,1)),'_',num2str(t(1,2)),'_',num2str(t(1,3)),'_',num2str(t(1,4)),'_',num2str(t(1,5)),'_',num2str(t(1,6)),'.xls'));
end
if rc==0
   alname=[cellstr('Random guess');alname];
   subplot(1,2,1),legend(alname);
   subplot(1,2,2),legend(alname);
   T=table(METHOD,SEN,SPC,PRE,FPR,ACC) 
   writetable(T,strcat('results\evaluation_',num2str(t(1,1)),'_',num2str(t(1,2)),'_',num2str(t(1,3)),'_',num2str(t(1,4)),'_',num2str(t(1,5)),'_',num2str(t(1,6)),'.xls'));
end
t=clock;
res
%saveas(f1,strcat('results/Diagram_',num2str(t(1,1)),'_',num2str(t(1,2)),'_',num2str(t(1,3)),'_',num2str(t(1,4)),'_',num2str(t(1,5)),'_',num2str(t(1,6))),'fig');
fid=fopen(strcat('results\Description_',num2str(t(1,1)),'_',num2str(t(1,2)),'_',num2str(t(1,3)),'_',num2str(t(1,4)),'_',num2str(t(1,5)),'_',num2str(t(1,6)),'.txt'),'at');
for i=1:size(res,1)
    fprintf(fid,'%s\n',res{i,:});
end
fclose(fid);


% --- Executes on button press in checkbox37.
function checkbox37_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c=0;
set(handles.pushbutton32,'enable','on'); 
x=get(handles.checkbox37,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox38,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox39,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox40,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox41,'value');
if x==1
    c=c+1;
end
if c==0
   set(handles.pushbutton32,'enable','off'); 
end
% Hint: get(hObject,'Value') returns toggle state of checkbox37


% --- Executes on button press in checkbox38.
function checkbox38_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c=0;
set(handles.pushbutton32,'enable','on'); 
x=get(handles.checkbox37,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox38,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox39,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox40,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox41,'value');
if x==1
    c=c+1;
end
if c==0
   set(handles.pushbutton32,'enable','off'); 
end
% Hint: get(hObject,'Value') returns toggle state of checkbox38


% --- Executes on button press in checkbox39.
function checkbox39_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c=0;
set(handles.pushbutton32,'enable','on'); 
x=get(handles.checkbox37,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox38,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox39,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox40,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox41,'value');
if x==1
    c=c+1;
end
if c==0
   set(handles.pushbutton32,'enable','off'); 
end
% Hint: get(hObject,'Value') returns toggle state of checkbox39


% --- Executes on button press in checkbox40.
function checkbox40_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c=0;
set(handles.pushbutton32,'enable','on'); 
x=get(handles.checkbox37,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox38,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox39,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox40,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox41,'value');
if x==1
    c=c+1;
end
if c==0
   set(handles.pushbutton32,'enable','off'); 
end
% Hint: get(hObject,'Value') returns toggle state of checkbox40


% --- Executes on button press in checkbox41.
function checkbox41_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c=0;
set(handles.pushbutton32,'enable','on'); 
x=get(handles.checkbox37,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox38,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox39,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox40,'value');
if x==1
    c=c+1;
end
x=get(handles.checkbox41,'value');
if x==1
    c=c+1;
end
if c==0
   set(handles.pushbutton32,'enable','off'); 
end
% Hint: get(hObject,'Value') returns toggle state of checkbox41


% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
loadedfile=get(handles.edit1,'string');
input=importdata(loadedfile);
labelc=str2num(get(handles.edit2,'string'));
val=get(handles.checkbox23,'value');
if val==1
   input(1,:)=[];
end
val=get(handles.checkbox24,'value');
if val==1
   input(:,1)=[];
end
label=input(:,labelc);
input(:,labelc)=[];
x=get(handles.popupmenu7,'value');
k=get(handles.popupmenu9,'value');
set(handles.popupmenu2,'value',k);
if x==1
   pushbutton24_Callback(hObject, eventdata, handles); 
else
   pushbutton32_Callback(hObject, eventdata, handles) 
end
newinp=[];
global besten;
[m,n]=size(besten);
for i=1:n
    newinp=[newinp,input(:,besten(1,i))];
end
newinp=[newinp,label];
if exist('ensemble.txt', 'file')==2
  delete('ensemble.txt');
end
dlmwrite('ensemble.txt',newinp);
set(handles.edit1,'string','ensemble.txt');
set(handles.checkbox23,'value',0);
set(handles.checkbox24,'value',0);
set(handles.edit2,'string',num2str(n+1));

set(handles.checkbox12,'value',0);
set(handles.checkbox13,'value',0);
set(handles.checkbox14,'value',0);
set(handles.checkbox15,'value',0);
set(handles.checkbox16,'value',0);
set(handles.checkbox17,'value',0);
set(handles.checkbox18,'value',0);
set(handles.checkbox19,'value',0);
set(handles.checkbox20,'value',0);
set(handles.checkbox21,'value',0);
set(handles.checkbox22,'value',0);
set(handles.checkbox37,'value',0);
set(handles.checkbox38,'value',0);
set(handles.checkbox39,'value',0);
set(handles.checkbox40,'value',0);
set(handles.checkbox41,'value',0);
x=get(handles.popupmenu10,'value');
k=get(handles.popupmenu11,'value');
if x==1
   if k==1
      set(handles.checkbox12,'value',1);
   end
   if k==2
      set(handles.checkbox13,'value',1);
   end
   if k==3
      set(handles.checkbox14,'value',1);
   end
   if k==4
      set(handles.checkbox15,'value',1);
   end
   if k==5
      set(handles.checkbox16,'value',1);
   end
   if k==6
      set(handles.checkbox17,'value',1);
   end
   if k==7
      set(handles.checkbox18,'value',1);
   end
   if k==8
      set(handles.checkbox19,'value',1);
   end
   if k==9
      set(handles.checkbox20,'value',1);
   end
   if k==10
      set(handles.checkbox21,'value',1);
   end
   if k==11
      set(handles.checkbox22,'value',1);
   end
else
   if k==1
      set(handles.checkbox37,'value',1);
   end
   if k==2
      set(handles.checkbox38,'value',1);
   end
   if k==3
      set(handles.checkbox39,'value',1);
   end
   if k==4
      set(handles.checkbox40,'value',1);
   end
   if k==5
      set(handles.checkbox41,'value',1);
   end 
end

nof=get(handles.edit83,'string');
set(handles.edit63,'string',num2str(min([n,str2num(nof)])));

x=get(handles.popupmenu10,'value');
k=get(handles.popupmenu12,'value');
set(handles.popupmenu2,'value',k);
if x==1
   pushbutton24_Callback(hObject, eventdata, handles); 
else
   pushbutton32_Callback(hObject, eventdata, handles) 
end

% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7
x=get(handles.popupmenu7,'value');
if x==1
    v='WCC';
    v=cellstr(v);
    v=[v;'LCA';'GA';'PSO';'ACO';'ICA';'HTS';'FOA';'DSOS';'CUK'];
    set(handles.popupmenu8,'string',v);
else
    v='PC';
    v=cellstr(v);
    v=[v;'LP';'EN';'MI';'FI'];
    set(handles.popupmenu8,'string',v);
end


% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu8.
function popupmenu8_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu8
set(handles.checkbox12,'value',0);
set(handles.checkbox13,'value',0);
set(handles.checkbox14,'value',0);
set(handles.checkbox15,'value',0);
set(handles.checkbox16,'value',0);
set(handles.checkbox17,'value',0);
set(handles.checkbox18,'value',0);
set(handles.checkbox19,'value',0);
set(handles.checkbox20,'value',0);
set(handles.checkbox21,'value',0);
set(handles.checkbox22,'value',0);
set(handles.checkbox37,'value',0);
set(handles.checkbox38,'value',0);
set(handles.checkbox39,'value',0);
set(handles.checkbox40,'value',0);
set(handles.checkbox41,'value',0);
x=get(handles.popupmenu7,'value');
k=get(handles.popupmenu8,'value');
if x==1
   if k==1
      set(handles.checkbox12,'value',1);
   end
   if k==2
      set(handles.checkbox13,'value',1);
   end
   if k==3
      set(handles.checkbox14,'value',1);
   end
   if k==4
      set(handles.checkbox15,'value',1);
   end
   if k==5
      set(handles.checkbox16,'value',1);
   end
   if k==6
      set(handles.checkbox17,'value',1);
   end
   if k==7
      set(handles.checkbox18,'value',1);
   end
   if k==8
      set(handles.checkbox19,'value',1);
   end
   if k==9
      set(handles.checkbox20,'value',1);
   end
   if k==10
      set(handles.checkbox21,'value',1);
   end
   if k==11
      set(handles.checkbox22,'value',1);
   end
else
   if k==1
      set(handles.checkbox37,'value',1);
   end
   if k==2
      set(handles.checkbox38,'value',1);
   end
   if k==3
      set(handles.checkbox39,'value',1);
   end
   if k==4
      set(handles.checkbox40,'value',1);
   end
   if k==5
      set(handles.checkbox41,'value',1);
   end 
end


% --- Executes during object creation, after setting all properties.
function popupmenu8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu9.
function popupmenu9_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu9 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu9
k=get(handles.popupmenu9,'value');
set(handles.popupmenu2,'value',k);

% --- Executes during object creation, after setting all properties.
function popupmenu9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu10.
function popupmenu10_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu10 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu10
x=get(handles.popupmenu10,'value');
if x==1
    v='WCC';
    v=cellstr(v);
    v=[v;'LCA';'GA';'PSO';'ACO';'ICA';'HTS';'FOA';'DSOS';'CUK'];
    set(handles.popupmenu11,'string',v);
else
    v='PC';
    v=cellstr(v);
    v=[v;'LP';'EN';'MI';'FI'];
    set(handles.popupmenu11,'string',v);
end

% --- Executes during object creation, after setting all properties.
function popupmenu10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu11.
function popupmenu11_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu11 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu11


% --- Executes during object creation, after setting all properties.
function popupmenu11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu12.
function popupmenu12_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu12 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu12


% --- Executes during object creation, after setting all properties.
function popupmenu12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit82_Callback(hObject, eventdata, handles)
% hObject    handle to edit82 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit82 as text
%        str2double(get(hObject,'String')) returns contents of edit82 as a double


% --- Executes during object creation, after setting all properties.
function edit82_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit82 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit83_Callback(hObject, eventdata, handles)
% hObject    handle to edit83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit83 as text
%        str2double(get(hObject,'String')) returns contents of edit83 as a double


% --- Executes during object creation, after setting all properties.
function edit83_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
