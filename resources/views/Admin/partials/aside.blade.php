<aside>
    <div class="logo"><a href="">Company name</a></div>

    <div class="sidebar-menu">
        <ul>
            <li class="dropdown"><a class="{{ request()->is('/') || request()->is('new-words') || request()->is('new-words/*') ? 'active_page' : '' }}" href="#" data-toggle="collapse">New Words</a>
                <ul class="sub__menu dropdown_menu {{ request()->is('/') || request()->is('new-words') || request()->is('new-words/*') ? 'active_menu' : '' }}">
                    <li><a class="{{ request()->is('/') || request()->is('new-words/beginner') || request()->is('new-words/beginner/*') ? 'active' : '' }}" href="{{route('admin.new.words.index', 'beginner')}}">Beginner</a></li>
                    <li><a class="{{ request()->is('/') || request()->is('new-words/intermediate') || request()->is('new-words/intermediate/*') ? 'active' : '' }}" href="{{route('admin.new.words.index', 'intermediate')}}">Intermediate</a></li>
                    <li><a class="{{ request()->is('/') || request()->is('new-words/advanced') || request()->is('new-words/advanced/*') ? 'active' : '' }}" href="{{route('admin.new.words.index', 'advanced')}}">Advanced</a></li>
                </ul>
            </li>
            <li class="dropdown"><a class="{{ request()->is('new-phrases') || request()->is('new-phrases/*') ? 'active_page' : '' }}" href="#" data-toggle="collapse">New Phrases</a>
                <ul class="sub__menu dropdown_menu {{ request()->is('/') || request()->is('new-words') || request()->is('new-phrases/*') ? 'active_menu' : '' }}">
                    <li><a class="{{ request()->is('new-phrases/beginner') || request()->is('new-phrases/beginner/*') ? 'active' : '' }}" href="{{route('admin.new.phrases.index', 'beginner')}}">Beginner</a></li>
                    <li><a class="{{ request()->is('new-phrases/intermediate') || request()->is('new-phrases/intermediate/*') ? 'active' : '' }}" href="{{route('admin.new.phrases.index', 'intermediate')}}">Intermediate</a></li>
                    <li><a class="{{ request()->is('new-phrases/advanced') || request()->is('new-phrases/advanced/*') ? 'active' : '' }}" href="{{route('admin.new.phrases.index', 'advanced')}}">Advanced</a></li>
                </ul>
            </li>

            <li class="dropdown"><a class="{{ request()->is('new-verbs') || request()->is('new-verbs/*') ? 'active_page' : '' }}" href="#" data-toggle="collapse">New Verbs</a>
                <ul class="sub__menu dropdown_menu {{ request()->is('/') || request()->is('new-words') || request()->is('new-verbs/*') ? 'active_menu' : '' }}">
                    <li><a class="{{request()->is('new-verbs/beginner') || request()->is('new-verbs/beginner/*') ? 'active' : '' }}" href="{{route('admin.new.verbs.index', 'beginner')}}">Beginner</a></li>
                    <li><a class="{{ request()->is('new-verbs/intermediate') || request()->is('new-verbs/intermediate/*') ? 'active' : '' }}" href="{{route('admin.new.verbs.index', 'intermediate')}}">Intermediate</a></li>
                    <li><a class="{{ request()->is('new-verbs/advanced') || request()->is('new-verbs/advanced/*') ? 'active' : '' }}" href="{{route('admin.new.verbs.index', 'advanced')}}">Advanced</a></li>
                </ul>
            </li>
            <li class="dropdown"><a href="" class="{{ request()->is('reading-and-listening') || request()->is('reading-and-listening/*') ? 'active_page' : '' }}" data-toggle="collapse">Reading and Listening</a>
                <ul class="sub__menu dropdown_menu {{ request()->is('reading-and-listening') || request()->is('reading-and-listening/*') ? 'active_menu' : '' }}">
                    <li class="dropdown2"><a class="{{ request()->is('reading-and-listening/conversations') || request()->is('reading-and-listening/conversations/*') ? 'active' : '' }}" href="" data-toggle="collapse">Conversations</a>
                        <ul class="sub__menu2 dropdown_menu2 {{ request()->is('reading-and-listening/conversations') || request()->is('reading-and-listening/conversations/*') ? 'active_menu2' : '' }}">
                            <li><a class="{{request()->is('reading-and-listening/conversations/beginner') || request()->is('reading-and-listening/conversations/beginner/*') ? 'active' : '' }}" href="{{route('admin.new.conversations.index', 'beginner')}}">Beginner</a></li>
                            <li><a class="{{request()->is('reading-and-listening/conversations/intermediate') || request()->is('reading-and-listening/conversations/intermediate/*') ? 'active' : '' }}" href="{{route('admin.new.conversations.index', 'intermediate')}}">Intermediate</a></li>
                            <li><a class="{{request()->is('reading-and-listening/conversations/advanced') || request()->is('reading-and-listening/conversations/advanced/*') ? 'active' : '' }}" href="{{route('admin.new.conversations.index', 'advanced')}}">Advanced</a></li>
                        </ul>
                    </li>
                    <li class="dropdown2"><a class="{{ request()->is('reading-and-listening/stories') || request()->is('reading-and-listening/stories/*') ? 'active' : '' }}" href="" data-toggle="collapse">Stories</a>
                        <ul class="sub__menu2 dropdown_menu2 {{ request()->is('reading-and-listening/stories') || request()->is('reading-and-listening/stories/*') ? 'active_menu2' : '' }}">
                            <li><a class="{{request()->is('reading-and-listening/stories/beginner') || request()->is('reading-and-listening/stories/beginner/*') ? 'active' : '' }}" href="{{route('admin.new.stories.index', 'beginner')}}">Beginner</a></li>
                            <li><a class="{{request()->is('reading-and-listening/stories/intermediate') || request()->is('reading-and-listening/stories/intermediate/*') ? 'active' : '' }}" href="{{route('admin.new.stories.index', 'intermediate')}}">Intermediate</a></li>
                            <li><a class="{{request()->is('reading-and-listening/stories/advanced') || request()->is('reading-and-listening/stories/advanced/*') ? 'active' : '' }}" href="{{route('admin.new.stories.index', 'advanced')}}">Advanced</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li><a href="{{ route('admin.new.exercises.index') }}" class="{{ request()->segment(1) == 'my-exercises' ? 'active_page active' : '' }}">My exercises</a></li>
            <li><a href="{{ route('admin.news.index') }}" class="{{ request()->is('news') ? 'active_page active' : '' }}">News</a></li>
            <li>
                <form method="post" action="{{route('logout')}}">
                    @csrf
                    <button type="submit" class="btn btn-primary logout__btn" >Logout</button>
                </form>
            </li>
        </ul>
    </div>
</aside>