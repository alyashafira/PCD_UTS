function varargout = GUI_UTS(varargin)
% GUI_UTS MATLAB code for GUI_UTS.fig
%      GUI_UTS, by itself, creates a new GUI_UTS or raises the existing
%      singleton*.
%
%      H = GUI_UTS returns the handle to a new GUI_UTS or the handle to
%      the existing singleton*.
%
%      GUI_UTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_UTS.M with the given input arguments.
%
%      GUI_UTS('Property','Value',...) creates a new GUI_UTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_UTS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_UTS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_UTS

% Last Modified by GUIDE v2.5 30-Apr-2021 15:02:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_UTS_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_UTS_OutputFcn, ...
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


% --- Executes just before GUI_UTS is made visible.
function GUI_UTS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_UTS (see VARARGIN)

% Choose default command line output for GUI_UTS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_UTS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_UTS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile('*.*');
 
if ~isequal(filename,0)
 
    Img = imread(fullfile(pathname,filename));
    [~,~,m] = size(Img);
    if m == 3
        axes(handles.axes1)
        imshow(Img)
        handles.Img = Img;
        guidata(hObject, handles)
    else
        msgbox('Please insert RGB Image')
    end
else
    return
end


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
set(handles.radiobutton4,'Value',1)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',0)
 
Img = handles.Img;
axes(handles.axes1)
cla('reset')
imshow(Img)
 
R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);
 
axes(handles.axes2)
cla('reset')
h = histogram(R(:),256);
h.FaceColor = [1 0 0];
h.EdgeColor = 'r';
hold on
 
h = histogram(G(:),256);
h.FaceColor = [0 1 0];
h.EdgeColor = 'g';
 
h = histogram(B(:),256);
h.FaceColor = [0 0 1];
h.EdgeColor = 'b';
grid on
set(gca,'Xlim',[0 255])
hold off
 
% Image Complement
Img_Comp = imcomplement(Img);
 
axes(handles.axes3)
cla('reset')
imshow(Img_Comp)
 
R = Img_Comp(:,:,1);
G = Img_Comp(:,:,2);
B = Img_Comp(:,:,3);
 
axes(handles.axes4)
cla('reset')
h = histogram(R(:),256);
h.FaceColor = [1 0 0];
h.EdgeColor = 'r';
hold on
 
h = histogram(G(:),256);
h.FaceColor = [0 1 0];
h.EdgeColor = 'g';
 
h = histogram(B(:),256);
h.FaceColor = [0 0 1];
h.EdgeColor = 'b';
set(gca,'Xlim',[0 255])
grid on
hold off


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',1)
set(handles.radiobutton6,'Value',0)
 
Img = handles.Img;
Gray = rgb2gray(Img);
 
axes(handles.axes1)
cla('reset')
imshow(Gray)
 
axes(handles.axes2)
cla('reset')
h = histogram(Gray(:),256);
h.FaceColor = [0.5 0.5 0.5];
h.EdgeColor = [0.5 0.5 0.5];
set(gca,'Xlim',[0 255])
grid on
 
% Image Complement
Gray_Comp = imcomplement(Gray);
axes(handles.axes3)
cla('reset')
imshow(Gray_Comp)
 
axes(handles.axes4)
cla('reset')
h = histogram(Gray_Comp(:),256);
h.FaceColor = [0.5 0.5 0.5];
h.EdgeColor = [0.5 0.5 0.5];
set(gca,'Xlim',[0 255])
grid on

% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hint: get(hObject,'Value') returns toggle state of radiobutton3
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',1)
 
Img = handles.Img;
Gray = rgb2gray(Img);
bw = im2bw(Gray,graythresh(Gray));
 
axes(handles.axes1)
cla('reset')
imshow(bw)
 
axes(handles.axes2)
h = histogram(double(bw(:)),2);
h.FaceColor = [0 0 0];
h.EdgeColor = [0 0 0];
set(gca,'Xlim',[0 1])
grid on
 
% Image complement
bw_Comp = ~bw;
 
axes(handles.axes3)
cla('reset')
imshow(bw_Comp)
 
axes(handles.axes4)
h = histogram(double(bw_Comp(:)),2);
h.FaceColor = [0 0 0];
h.EdgeColor = [0 0 0];
set(gca,'Xlim',[0 1])
grid on


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close
