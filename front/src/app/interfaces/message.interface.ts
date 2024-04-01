export interface Message {
    id: number;
    userId: number;
    message: string;
    createdAt: string;
}

export interface MessageList {
    messages: Message[];
}

export interface MessageRequest {
    message: string;
}
  
export interface MessageResponse {
    message: string;
}
