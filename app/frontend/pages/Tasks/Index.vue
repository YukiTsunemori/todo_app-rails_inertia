<script setup lang="ts">
import { Form, Link } from '@inertiajs/vue3'
import { LoaderCircle } from "lucide-vue-next"

import InputError from "@/components/InputError.vue"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { editTaskPath, taskPath } from '@/routes'

const props = defineProps({
  tasks: Object
})
</script>
<template>
  <div class="border-b border-gray-900/10 pb-12">
    <Form
      action="/tasks"
      method="post"
      class="flex flex-col gap-6"
      #default="{ errors, processing }"
    >
      <div class="grid gap-2">
        <Label for="task[name]">タスク名: </Label>
        <Input
          type="text"
          name="task[name]"
          id="task[name]"
          placeholder="タスク名を入力"
        />
        <InputError :message="errors['task.name']" />
      </div>

      <div class="grid gap-2">
        <Label for="task[memo]">メモ: </Label>
        <Input 
          type="text"
          name="task[memo]"
          id="task[memo]"
          placeholder="メモを入力できます"
          />
      </div>

      <div class="grid gap-2">
        <Label for="task[deadline_at]">締切日: </Label>
        <Input
          type="datetime-local"
          name="task[deadline_at]"
          id="task[deadline_at]"
          />
      </div>

      <Button type="submit" :disabled="processing">
        <LoaderCircle v-if="processing" class="h-4 w-4 animate-spin" />
        Create Task
      </Button>
    </Form>

    <h1>Task一覧</h1>
      <div v-for="task in props.tasks" :key="task.id" class="flex">
        {{ task.name }}
        <Link :href="editTaskPath({id: task.id})"><Button>編集</Button></Link>
        <Form :action="taskPath({id: task.id})" method="delete">
          <Button type="submit">削除</Button>
        </Form>
      </div>
  </div>
</template>
