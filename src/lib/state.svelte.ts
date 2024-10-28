import type { Course } from "./types";

type Box<T> = {
    value: T;
};

export const joinDialogOpen = $state<Box<boolean>>({ value: false });
export const feedbackDialogOpen = $state<Box<boolean>>({ value: false });
export const courses = $state<Box<Course[]>>({ value: [] });
