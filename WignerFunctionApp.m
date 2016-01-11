function varargout = WignerFunctionApp(varargin)
% WIGNERFUNCTIONAPP MATLAB code for WignerFunctionApp.fig
%      WIGNERFUNCTIONAPP, by itself, creates a new WIGNERFUNCTIONAPP or raises the existing
%      singleton*.
%
%      H = WIGNERFUNCTIONAPP returns the handle to a new WIGNERFUNCTIONAPP or the handle to
%      the existing singleton*.
%
%      WIGNERFUNCTIONAPP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WIGNERFUNCTIONAPP.M with the given input arguments.
%
%      WIGNERFUNCTIONAPP('Property','Value',...) creates a new WIGNERFUNCTIONAPP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WignerFunctionApp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WignerFunctionApp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WignerFunctionApp

% Last Modified by GUIDE v2.5 03-Dec-2015 08:48:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WignerFunctionApp_OpeningFcn, ...
                   'gui_OutputFcn',  @WignerFunctionApp_OutputFcn, ...
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


% --- Executes just before WignerFunctionApp is made visible.
function WignerFunctionApp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WignerFunctionApp (see VARARGIN)





% Choose default command line output for WignerFunctionApp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes WignerFunctionApp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = WignerFunctionApp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%detetermining the selected data set:

%axes(handle.axes1);

%set both panels to non-visible
if(get(hObject,'Value')==1)
    set(handles.uipanel1,'Visible','off');
    set(handles.uipanel2,'Visible','off');
end
%set gaussian panel on and all others off
if(get(hObject,'Value')==2)
    set(handles.uipanel1,'Visible','on');
    set(handles.uipanel2,'Visible','off');
    [x,y,f]=WigFun(get(handles.slider1,'Value'),get(handles.slider2,'Value'),-10,10);
    mesh(x,y,f);
end
%set Pulse panel on and all the rest off
if(get(hObject,'Value')==3)
    set(handles.uipanel1,'Visible','off');
    set(handles.uipanel2,'Visible','on');
end

%str = get(hObject, 'String');
%val = get(hObject, 'Value');

%Use a switch to select current data

%switch str{val};
%    case 'Gausssian' %gaussian option selected
%        %want to make the gaussian panel vissible        
%        handles.current_data = WigFun;
%    case 'Pulse' %pulse option selected
%        handles.current_data = Pulse;
%end

%We save the structure of the handles

guidata(hObject,handles)

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


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s1=get(handles.slider1,'value');
set(handles.edit1,'String',s1);
disp(s1);
wigRefresh(hObject, eventdata, handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slide


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Value',1);
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s2=get(handles.slider2,'value');
set(handles.edit2,'String',s2);
disp(s2);
wigRefresh(hObject, eventdata, handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Value',1);
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2double(get(handles.edit1, 'String'));
set(handles.slider1, 'Value', val);

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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2double(get(handles.edit2, 'String'));
set(handles.slider2, 'Value', val);
% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.n 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Create general function that links the slider movement with the edit text
%and vice versa

function wigRefresh(hObject, eventdata, handles)
    [X,Y,Z]=WigFun(get(handles.slider1,'Value'),get(handles.slider2,'Value'),-10,10);
    mesh(X,Y,Z);
    