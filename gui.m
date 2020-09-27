function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 02-Dec-2014 13:06:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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

% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
global x;
x = [];
global speed;
speed = .85;
global keepGoing;
keepGoing = true;
particles0();

% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
global keepGoing
keepGoing = false;

% --- Executes on slider movement.
function speed_Callback(hObject, eventdata, handles)
global speed
% speed = get(handles.speed, 'Value');
speed = hObject.Value;

% --- Executes during object creation, after setting all properties.
function speed_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in part0.
function part0_Callback(hObject, eventdata, handles)
global x;
global y;
global vx;
global vy;
global num;
global speed;
global keepGoing;
keepGoing = true;
particles0();

% --- Executes on button press in part1.
function part1_Callback(hObject, eventdata, handles)
flag1 = ginput(1);
global keepGoing;
keepGoing = false;
particles1(flag1);

% --- Executes on button press in part2.
function part2_Callback(hObject, eventdata, handles)
[flags] = ginput(1);
flag1 = flags(1,:);
%flag2 = flags(2,:);
global keepGoing;
keepGoing = false;
particles2(flag1);

% --- Executes on button press in part3.
function part3_Callback(hObject, eventdata, handles)
[flags] = ginput(3);
flag1 = flags(1,:);
flag2 = flags(2,:);
flag3 = flags(3,:);
global keepGoing;
keepGoing = false;
particles3(flag1,flag2,flag3);

% --- Executes on button press in part4.
function part4_Callback(hObject, eventdata, handles)
[flags] = ginput(1);
flag1 = flags(1,:);
%flag2 = flags(2,:);
%flag3 = flags(3,:);
%flag4 = flags(4,:);
global keepGoing;
keepGoing = false;
particles4(flag1);


% --- Executes on button press in part5.
function part5_Callback(hObject, eventdata, handles)
% hObject    handle to part5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[flags] = ginput(5);
flag1 = flags(1,:);
flag2 = flags(2,:);
flag3 = flags(3,:);
flag4 = flags(4,:);
flag5 = flags(5,:);
global keepGoing;
keepGoing = false;
particles5(flag1,flag2,flag3,flag4,flag5);
